// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simplecal/widgets/buttons.dart';
import 'package:simplecal/widgets/calculation.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  var realvalue;
  var condition = true, result;
  var incognitocolor = true;
  var calcultext = "";
  void fun(var a) {
    setState(() {
      if (a == "AC") {
        calcultext = "";
        condition = true;
      } else if (a == "⌫") {
        if (calcultext.length == 1) {
          calcultext = "";
        } else {
          calcultext = calcultext.substring(0, calcultext.length - 1);
          if (calcultext.substring(calcultext.length - 1, calcultext.length) ==
              "(") {
            condition = true;
          } else if (calcultext.substring(
                  calcultext.length - 1, calcultext.length) ==
              ")") {
            condition = false;
          }
        }
      } else if (a == "%") {
        var exp = double.parse(calcultext) / 100;
        calcultext = '$exp';
      } else if (a == "()") {
        if (condition == true) {
          calcultext = "$calcultext(";
          condition = false;
        } else {
          calcultext = "$calcultext)";
          condition = true;
        }
      } else if (a == "=") {
        try {
          Parser p = Parser();
          Expression exp = p.parse(calcultext);

          ContextModel cm = ContextModel();

          calcultext = double.parse('${exp.evaluate(EvaluationType.REAL, cm)}').toStringAsFixed(2);  ;
        } catch (e) {
          calcultext = "Error";
        }
      } else if (a == "x") {
        calcultext = "$calcultext*";
      } else {
        calcultext = "$calcultext$a";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var color1 = incognitocolor == false ? Colors.yellow : Colors.grey;
    var color2 = Colors.orange;
    var color3 =
        incognitocolor == false ? Colors.grey.shade400 : Colors.grey.shade700;
    final mediaquery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: incognitocolor == false ? Colors.white : Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  height:
                      (mediaquery.size.height - mediaquery.padding.top) * 0.14,
                  child: Switch(
                      activeColor: Colors.white,
                      value: incognitocolor,
                      onChanged: (val) {
                        setState(() {
                          incognitocolor = val;
                        });
                      })),
              Container(
                height: (mediaquery.size.height - mediaquery.padding.top) * 0.20,
                child: Calculation(calcultext, incognitocolor),
              ),
              Container(
                height: (mediaquery.size.height - mediaquery.padding.top) * 0.66,
                child: Buttons(fun, color1, color2, color3),
              )
            ],
          ),
        ));
  }
}
