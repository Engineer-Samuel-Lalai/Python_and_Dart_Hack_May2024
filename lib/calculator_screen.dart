//lib/arithmetic.dart
import 'package:flutter/material.dart';

class CalculatorScreen  extends StatefulWidget{
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculate(String operation) {
    final int num1 = int.parse(_num1Controller.text);
    final int num2 = int.parse(_num2Controller.text);

    setState(() {
      try {
        switch(operation) {
          case '+':
          _result = (num1 + num2).toString();
          break;
          case '-':
          _result = (num1 - num2).toString();
          break;
          case '*':
          _result = (num1 * num2).toString();
          break;
          case '/':
          if (num2 ==0) {
            _result = 'Cannot divide by zero';
          } else {
            _result = (num1 / num2).toString();
          }
          break;
          case '%':
          _result = (num1 % num2).toString();
          break;
          default:
          _result = 'Invalid operation';
        }
      } catch (e) {
        _result = 'Error: $e';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter the First Number'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter the Second Number'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['+', '-', '*', '/', '%'].map((op) {
                return ElevatedButton(
                  onPressed: () => _calculate(op),
                  child: Text(op)
                  );
              }).toList(),
          ),
          const SizedBox(height: 20),
          Text('Result: $_result'),
          ],
      ),
      ),
  
    );
    }
  }
