import 'package:flutter/material.dart';

class ButtonLook extends StatelessWidget {
  // Radius rad=5;
  final String text;
  final Color color;
  Function fun;
  // Buttons(this.calcultex);
  ButtonLook(this.text, this.color,this.fun);
  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
            backgroundColor: color,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            onPressed: () {
              fun(text);
            });
  }
}
