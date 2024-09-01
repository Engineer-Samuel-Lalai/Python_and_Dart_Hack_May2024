//Arithmetic
//Import libraries
import 'dart:io';



  int num1=0;
  int num2=0;
  int add(num1, num2) => num1 + num2;
  int subtract(num1, num2) => num1 - num2;
  int multiply(num1, num2) => num1 * num2;
  double divide(num1, num2) {
    if (num2 == 0){
      throw ArgumentError('Cannot divide by zero');
    }
    return num1 / num2;
  }
  int modulus(num1, num2) => num1 % num2;

void main(){
  //Adding two numbers
  print("Welcome to the Dart Calculator");

  //Requesting the first number from the user
  print('Enter the First Number:');
  int num1 = int.parse(stdin.readLineSync()!);

  //Get the Second Number from the user
  print('Enter the Second Number');
  int num2 = int.parse(stdin.readLineSync()!);

  //Get the Operation choice from the User
  print('Choose and operation (+, -, *, /, %);');
  String operation = stdin.readLineSync()!;

  //Perform the chosen operation
  double result;
  switch(operation){
    case '+':
    result = add(num1, num2).toDouble();
    break;
    case '-':
    result = subtract(num1, num2).toDouble();
    break;
    case '*':
    result = multiply(num1, num2).toDouble();
    break;
    case '/':
    result = divide(num1, num2).toDouble();
    break;
    case '%':
    result = modulus(num1, num2).toDouble();
    break;
    default:
    print('Invalid operation');
    return;
  }
  print('The result is: $result');

}