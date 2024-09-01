import 'dart:io';

void main(){
  print('Welcome to Dart Multi-Step Calculator');

  double? result; //Yo store the result of calculation
  bool continueCalculating = true;

  while (continueCalculating){
    if (result == null){
      //First calculation
      print('Enter the first number:');
      result = double.parse(stdin.readLineSync()!);
    }

    //Get the operation choice from the user
    print('Choose an operation (+, -, *, /) or type "exit" to quit:');
    String operation = stdin.readLineSync()!;
    if (operation == 'exit') {
      continueCalculating = false;
      print('Exiting calculator. Goodbye!');
      break;
    }
    //Get the next number from the user
    print('Enter the next number: ');
    double num2 = double.parse(stdin.readLineSync()!);

    //Perform the chosen operation
    try{
      switch(operation){
        case '+':
        result = add(result, num2);
        break;
        case '-':
        result = subtract(result, num2);
        break;
        case '*':
        result = multiply(result, num2);
        break;
        case '/':
        result = divide(result, num2);
        break;
        case '%':
        result = modulus(result, num2);
        break;
        default:
        print('Invalid operation. Please try again.');
        continue; //skip printing the result and ask for input again

      }

      //Display the result
      print('The result is: $result');

      //Ask if the user wants to continue
      print('Do you want to perform another operation with the result? (yes/no)');
      String? response = stdin.readLineSync()!;
      if (response.toLowerCase() != 'yes') {
        continueCalculating = false;
        print('Exiting calculator. Goodbye!');

      }
      } catch (e) {
        print('error: $e');
        result = null; //Reset result to allow for new input
      }
    }
  }
  
  //Arithmetic operations
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b){
    if (a == 0) {
      throw ArgumentError('Cannot divide by zero');
    }
    return a / b;
  }
  double modulus(double a, double b) => a % b;

