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
        Column(mainAxisAlignment: MainAxisAlignment.end,
            children:[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '수식을 입력하시오',
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _buildElevatedButton('7'),
            _buildElevatedButton('8'),
            _buildElevatedButton('9'),
            _buildElevatedButton('*'),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _buildElevatedButton('4'),
            _buildElevatedButton('5'),
            _buildElevatedButton('6'),
            _buildElevatedButton('-'),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _buildElevatedButton('1'),
            _buildElevatedButton('2'),
            _buildElevatedButton('3'),
            _buildElevatedButton('+'),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _buildElevatedButton('clearAll'),
            _buildElevatedButton('0'),
            _buildElevatedButton('.'),
            _buildElevatedButton('='),
          ]),
        ])),
    );
  }

  Widget _buildElevatedButton(String data) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(120,100),
                textStyle: TextStyle(
                  fontSize: 50,
                ),
              ), child: Text(data), onPressed: () {
                if(data == "clearAll"){
                  _controller.text = "";
                }else if(data == "=") {
                  _calculate();
                }else {
                  _controller.text += data;
                }
            },),
    );
  }
}
