import 'package:flutter/material.dart';
class Calculation extends StatelessWidget {
  // const Calculation({ Key? key }) : super(key: key);
  final text;

  Calculation(this.text);

  @override
  Widget build(BuildContext context) {
    return 
      LayoutBuilder(builder: (ctx,constraints){
        return Container(
        height: constraints.maxHeight,
        // width: double.infinity,
        alignment: Alignment.bottomLeft,
        child: TextField(
          textAlign: TextAlign.end,
          keyboardType: null,
          readOnly: true,
          // controller: widget.calculx,
          showCursor: false,
          decoration: InputDecoration(border: InputBorder.none, hintText: text,hintStyle: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold)),
        ),
      );
      }); 
    
  }
}