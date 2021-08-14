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
  var opp1, opp2,result;
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
    } else if (a == "-") {
      if (calcultext.isEmpty) {
        setState(() {
          calcultext = '$calcultext$a';
        });
      } else {
        nonnumber(a);
      }
    } else {
      nonnumber(a);
    }
  }

  void nonnumber(String t) {
    setState(() {
      if (t == "AC") {
        calcultext = "";
      } else if (t == "+/-") {
        if (calcultext.substring(0, 1) == "-") {
          calcultext = '$calcultext';
          calcultext = calcultext.substring(1, calcultext.length);
        } else {
          calcultext = '-$calcultext';
        }
      } else if (t == "/" || t == "=" || t == "+" || t == "x" || t == "-") {
        if (opp1 == null) {
          opp1 = calcultext;
          calcultext = "";
          print(opp1);
        } else if (t == "+") {
          opp2 = calcultext;
          result = double.parse(opp1) + double.parse(opp2);
          opp1=result;
        } else if (t == "-") {
          opp2 = calcultext;
          result = double.parse(opp1) - double.parse(opp2);
          opp1=result;
          // calcultext = '$result';
        }
        else if (t == "x") {
          opp2 = calcultext;
          result = double.parse(opp1) * double.parse(opp2);
          opp1=result;
          // calcultext = '$result';
        }
        else if (t == "/") {
          opp2 = calcultext;
          result = double.parse(opp1) / double.parse(opp2);
          opp1=result;
          // calcultext = '$result';
        }
        else if(t=="=")
        {
          calcultext='$result';
        }

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
