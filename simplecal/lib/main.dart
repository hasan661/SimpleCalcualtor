// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:simplecal/widgets/buttons.dart';
import 'package:simplecal/widgets/calculation.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CalEX'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var condition = true, result;

  // List<dynamic> Expression = [];
  var calcultext = "";
  void fun(var a) {
    setState(() {
      if (a == "AC") {
        calcultext = "";
        condition=true;
      } else if (a == "⌫") {
        calcultext = calcultext.substring(0, calcultext.length - 1);
        if(calcultext.substring(calcultext.length-1,calcultext.length)=="(")
        {
          condition=true;
        }
        else if(calcultext.substring(calcultext.length-1,calcultext.length)==")")
        {
          condition=false;

        }
      } else if (a == "%") {
        var exp=double.parse(calcultext)/100;
        calcultext='$exp';
      } else if (a == "()") {
        if(condition==true)
        {
          calcultext="$calcultext(";
          condition=false;

        }
        else{
          calcultext="$calcultext)";
          condition=true;

        }
      } else if (a == "=") {
        try {
          Parser p = Parser();
          // calcultext="(2+3)*3";
          Expression exp = p.parse(calcultext);

          ContextModel cm = ContextModel();
          
          calcultext = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          calcultext = "Error";
        }
      } 
        else if(a=="x")
        {
          calcultext="$calcultext*";
        }
      else {
        calcultext = "$calcultext$a";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: (mediaquery.size.height - mediaquery.padding.top) * 0.34,
          child: Calculation(calcultext),
        ),
        Container(
          height: (mediaquery.size.height - mediaquery.padding.top) * 0.66,
          child: Buttons(fun),
        )
      ],
    ));
  }
}
