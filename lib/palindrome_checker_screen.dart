import 'package:flutter/material.dart';

class PalindromeCheckerScreen extends StatefulWidget {
  @override
  _PalindromeCheckerScreenState createState() => _PalindromeCheckerScreenState();
}

class _PalindromeCheckerScreenState extends State<PalindromeCheckerScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _result = '';

  void _checkPalindrome() {
    final String input = _inputController.text;
    final String cleanedInput = _cleanString(input);

    setState((){
      _result = cleanedInput == cleanedInput.split('').reversed.join('')
          ? 'The input is Palindrome.'
          : 'The input is not a palindrome';
    });
  }

  String _cleanString(String input) {
    return input.toLowerCase().replaceAll(RegExp(r'[W_]+'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palindrome Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(labelText:'Enter a String or Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPalindrome,
              child: const Text('Check Palindrome'),  
            ),
            const SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}