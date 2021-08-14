import 'package:flutter/material.dart';

import 'buttondata.dart';

import 'button_look.dart';

class Buttons extends StatelessWidget {
  // var calcultex;
  final fun;
  Buttons(this.fun);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,constraints){
      return Container(
        // height: 200,
     
        child: GridView(
        
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 110,
            childAspectRatio: 1.3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ),
          children: [...buttons.map((e) => ButtonLook(e.text, e.color,fun)).toList()],
        ),
      
    );
    }) ;
  }
}
