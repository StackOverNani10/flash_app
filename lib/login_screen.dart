import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_app/chat_screen.dart';
import 'package:flash_app/rounded_button.dart';
import 'package:flash_app/styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/logo.png'),
                  height: 200,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kInputDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kInputDecoration.copyWith(hintText: 'Enter your password'),
              ),
              RoundedButton(
                texto: 'Login',
                color: Colors.lightBlueAccent,
                action: () async {
                  //Implementar funcionamiento
                  try {
                    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                    );

                    if(credential != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
