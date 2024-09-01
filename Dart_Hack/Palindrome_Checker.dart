// *Palindrome Checker**
// Task: Write a Dart function that checks whether a given string is a palindrome. The function should ignore spaces, punctuation, and be case-insensitive.
// Bonus Points: Extend the function to check palindrome properties for numeric inputs as well.
// Objective: Test string manipulation, logic implementation, and handling edge cases.

import 'dart:io';

void main(){
  print('Enter a String or numeric input to check if it is palindrome:');
  String? input = stdin.readLineSync();

  if (input != null) {
    if (isPalindrome(input)) {
      print('The input is Palindrome.');
    } else {
      print('The input is not a palindrome');
    }
  } else {
    print('Invalid input.');
  }
}

bool isPalindrome(String input) {
  //Normalize input by removing spaces, punctuation, and converting to lowercase
  String cleanedInput = _cleanString(input);

  //Check if the cleaned input is a palindrome
  return cleanedInput == cleanedInput.split('').reversed.join('');

}

String _cleanString(String input) {
  //Convert to lowercase and remove non-alphanumeric characters
  return input.toLowerCase().replaceAll(RegExp(r'[\W_]+'), '');
}