import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404 Page not found',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            TextButton(
              onPressed: () {
                //Navigator.pop(context);
              },
              child: Text('Return'),
            ),
          ],
        ),
      ),
    );
  }
}