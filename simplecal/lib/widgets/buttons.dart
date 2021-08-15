import 'package:flutter/material.dart';



import 'button_look.dart';
import '../models/buttontext.dart';

class Buttons extends StatelessWidget {
  final color1;
  final color2;
  final color3;

  // var calcultex;
  final fun;
  const Buttons(this.fun, this.color1, this.color2, this.color3);

  @override
  Widget build(BuildContext context) {
    var buttons = [
      ButtonText(text: "AC", color: color1),
      ButtonText(text: "⌫", color: color1),
      ButtonText(text: "%", color: color1),
      ButtonText(text: "/", color: color2),
      ButtonText(text: "7", color: color3),
      ButtonText(text: "8", color: color3),
      ButtonText(text: "9", color: color3),
      ButtonText(text: "x", color: color2),
      ButtonText(text: "4", color: color3),
      ButtonText(text: "5", color: color3),
      ButtonText(text: "6", color: color3),
      ButtonText(text: "-", color: color2),
      ButtonText(text: "1", color: color3),
      ButtonText(text: "2", color: color3),
      ButtonText(text: "3", color: color3),
      ButtonText(text: "+", color: color2),
      ButtonText(text: "0", color: color3),
      ButtonText(text: "()", color: color3),
      ButtonText(text: ".", color: color3),
      ButtonText(text: "=", color: color2),
    ];
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: constraints.maxHeight >336.16?110: 90,
              childAspectRatio: 1.3,
              mainAxisSpacing:constraints.maxHeight >336.16? 10: 5,
              crossAxisSpacing:constraints.maxHeight >336.16?10 :5,),
          children: [
            ...buttons.map((e) => ButtonLook(e.text, e.color, fun)).toList()
          ],
        ),
      );
    });
  }
}
