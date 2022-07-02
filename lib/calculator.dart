import 'package:cowculator/constants/icons.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator {
  String result = "";
  bool finished = false;
  bool openParen = false;
  bool containsDecimal = false;

  Calculator();

  String getResult() {
    return result;
  }

  void input(String input) {
    switch (input) {
      case "CLR":
        {
          clear();
          break;
        }
      case "( )":
        {
          parentheses();
          break;
        }
      case "%":
        {
          percent();
          break;
        }
      case "/":
        {
          divide();
          break;
        }
      case "X":
        {
          multiply();
          break;
        }
      case "-":
        {
          subtract();
          break;
        }
      case "+":
        {
          add();
          break;
        }
      case ".":
        {
          decimal();
          break;
        }
      case "DEL":
        {
          delete();
          break;
        }
      case "=":
        {
          evaluate();
          break;
        }
      default:
        {
          numeric(int.parse(input));
          break;
        }
    }
  }

  void clear() {
    result = "";
    openParen = false;
    containsDecimal = false;
    finished = true;
  }

  void parentheses() {
    // TODO: Check finished parameter (in case expression starts with parentheses)
    if (openParen) {
      result += ')';
      openParen = false;
    } else {
      result += '(';
      openParen = true;
    }
  }

  void percent() {
    result += '%';
  }

  void divide() {
    result += '/';
  }

  void multiply() {
    result += 'x';
  }

  void subtract() {
    result += '-';
  }

  void add() {
    result = result + '+';
  }

  void delete() {
    if (result.isNotEmpty) {
      result = result.substring(0, result.length - 1);
    }
  }

  void decimal() {
    result += '.';
    containsDecimal = true;
  }

  numeric(int num) {
    if (finished) {
      // start new expression
      finished = false;
      result = num.toString();
    } else {
      // add to current expression
      result += num.toString();
    }
  }

  void evaluate() {
    // process string input
    // replace x with *, etc.
    // formatting % signs

    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    if (containsDecimal) {
      result = eval.toString();
    } else {
      result = eval.toInt().toString();
    }
    finished = true;
    openParen = false;
    containsDecimal = false;
  }
} // end of Calculator class
