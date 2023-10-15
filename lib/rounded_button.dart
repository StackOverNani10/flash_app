import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({super.key, required this.texto, required this.color, required this.action});

  String texto;
  Color color;
  void Function() action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(50),
        child: MaterialButton(
          onPressed: action,
          minWidth: 200.0,
          height: 50.0,
          child: Text(texto),
        ),
      ),
    );
  }
}
