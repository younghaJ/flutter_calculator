import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key); //생성자

  @override
  State<MyApp> createState() => _MyAppState();
}


class Calculator {
  String evaluate(String input) {
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double result = exp.evaluate(EvaluationType.REAL, cm);
    return result.toString();
  }
}

class _MyAppState extends State<MyApp> {

  String _result = '';

  TextEditingController _controller =
      TextEditingController();

  void _calculate() {
    Calculator calc = Calculator();
    setState(() {
      _result = calc.evaluate(_controller.text);
      _controller.text = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('계산기')),
        body:
        Column(mainAxisAlignment: MainAxisAlignment.end,children:[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'TextField',
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(child: Text('7'), onPressed: () {
              _controller.text += "7";
            },),
            TextButton(child: Text('8'), onPressed: () {
              _controller.text += "8";
            },),
            TextButton(child: Text('9'), onPressed: () {
              _controller.text += "9";
            },),
            TextButton(child: Text('*'), onPressed: () {
              _controller.text += "*";
            },),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(child: Text('4'), onPressed: () {
              _controller.text += "4";
            },),
            TextButton(child: Text('5'), onPressed: () {
              _controller.text += "5";
            },),
            TextButton(child: Text('6'), onPressed: () {
              _controller.text += "6";
            },),
            TextButton(child: Text('-'), onPressed: () {
              _controller.text += "-";
            },),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(child: Text('1'), onPressed: () {
              _controller.text += "1";
            },),
            TextButton(child: Text('2'), onPressed: () {
              _controller.text += "2";
            },),
            TextButton(child: Text('3'), onPressed: () {
              _controller.text += "3";
            },),
            TextButton(child: Text('+'), onPressed: () {
              _controller.text += "+";
            },),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(child: Text(' '), onPressed: () { },),
            TextButton(child: Text('0'), onPressed: () {
              _controller.text += "0";
            },),
            TextButton(child: Text('.'), onPressed: () {
              _controller.text += ".";
            },),
            TextButton(child: Text('='), onPressed: () {
              _calculate();
            },),
          ]),
        ])),
    );
  }
}
