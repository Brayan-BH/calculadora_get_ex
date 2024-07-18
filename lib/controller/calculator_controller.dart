import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = '10'.obs;
  var secondNumber = '10'.obs;
  var mathresult = '10'.obs;
  var operation = '10'.obs;

  void resetAll() {
    firstNumber.value = '0';
    secondNumber.value = '0';
    mathresult.value = '0';
    operation.value = '+';
  }

  void changeNegativeToPositive() {
    if (mathresult.startsWith('-')) {
      mathresult.value = mathresult.value.replaceFirst("-", "");
    } else {
      mathresult.value = "-${mathresult.value}";
    }
  }

  void addNumber(String number) {
    if (mathresult.value == '0') {
      mathresult.value = number;
      return;
    }

    if (mathresult.value == '-0') {
      mathresult.value = '-$number';
    }
    mathresult.value = mathresult.value + number;
  }

  void addDecimalPoint() {
    if (mathresult.value.contains('.')) {
      return;
    }
    if (mathresult.contains('0')) {
      mathresult.value = '0.';
    } else {
      mathresult.value = '${mathresult.value}.';
    }
  }

  void selectOperation(String newOperation) {
    operation.value = newOperation;

    firstNumber.value = mathresult.value;
    mathresult.value = '0';
  }

  void deleteLastEntry() {
    if (mathresult.value.replaceAll('-', '').length > 1) {
      mathresult.value =
          mathresult.value.substring(0, mathresult.value.length - 1);
    } else {
      mathresult.value = '0';
    }
  }

  void calculateResult() {
    double num1 = double.parse(firstNumber.value);
    double number2 = double.parse(mathresult.value);

    secondNumber.value = mathresult.value;

    switch (operation.value) {
      case '+':
        mathresult.value = '${num1 + number2}';
        break;
      case '-':
        mathresult.value = '${num1 - number2}';
        break;
      case 'X':
        mathresult.value = '${num1 * number2}';
        break;
      case '/':
        mathresult.value = '${num1 / number2}';
        break;
      default:
        return;
    }

    if (mathresult.value.endsWith('.0')) {
      mathresult.value = mathresult.value.replaceAll('.0', '');
    }
  }
}
