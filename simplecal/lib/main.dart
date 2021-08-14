// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:simplecal/widgets/buttons.dart';
import 'package:simplecal/widgets/calculation.dart';

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
  var opp1="", opp2="", operation="", result=0.00;
  var i = true;
  var calcultext = "";
  void fun(var a) {
    if (a != "AC" &&
        a != "+/-" &&
        a != "%" &&
        a != "/" &&
        a != "x" &&
        a != "+" &&
        a != "=" &&
        a != "()" &&
        a != "-") {
      setState(() {
        calcultext = '$calcultext$a';
      });
    }
    else if(a=="+")
    {
      setState(() {
      if(opp1=="" && result==0.00)
      {
        opp1="$calcultext";
        operation="$a";
        calcultext="";
      }
      else{
        opp2="$calcultext";
        calcultext="";
        result=result+double.parse(opp1)+double.parse(opp2);
        calcultext="$result";
        result=double.parse(calcultext);
        opp2="";
      }  
        
      });
      
    }
  }

  void nonnumber() {
    setState(() {
     
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
