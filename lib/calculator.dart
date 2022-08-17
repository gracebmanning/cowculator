import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:audioplayers/audioplayers.dart';
import 'localstorage.dart';
import 'dart:math' as math;

class Calculator {
  String result = "";
  bool startNewExp = false;
  bool openParen = false;
  bool invalid = false;
  AudioPlayer player = AudioPlayer();

  LocalStorage storage = LocalStorage();
  bool soundEffects = true;

  // initialize calculator with soundEffects value.
  Calculator() {
    () async {
      bool val = await storage.getSoundEffects();
      soundEffects = val;
    }();
  }

  String getResult() {
    return result;
  }

  bool getInvalid() {
    return invalid;
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
          try {
            evaluate();
            invalid = false;
          } on Exception {
            invalid = true;
          }
          break;
        }
      case "SIN":
        {
          sin();
          break;
        }
      case "ASIN":
        {
          asin();
          break;
        }
      case "COS":
        {
          cos();
          break;
        }
      // TODO: create ACOS case and function
      case "TAN":
        {
          tan();
          break;
        }
      // TODO: create ATAN case and function
      case "LOG":
        {
          log();
          break;
        }
      case "√":
        {
          sqrt();
          break;
        }
      case "π":
        {
          pi();
          break;
        }
      case "^":
        {
          exponent();
          break;
        }
      case "e":
        {
          e();
          break;
        }
      case "!":
        {
          factorial();
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
    startNewExp = true;
    openParen = false;
    invalid = false;
  }

  void parentheses() {
    if (startNewExp || result == "") {
      // start new expression
      result = '(';
      startNewExp = false;
      openParen = true;
    } else {
      // add to current expression
      if (openParen) {
        result += ')';
        openParen = false;
      } else {
        result += '(';
        openParen = true;
      }
    }
  }

  void percent() {
    result += '%';
    startNewExp = false;
  }

  void divide() {
    result += '/';
    startNewExp = false;
  }

  void multiply() {
    result += 'x';
    startNewExp = false;
  }

  void subtract() {
    result += '-';
    startNewExp = false;
  }

  void add() {
    result += '+';
    startNewExp = false;
  }

  void decimal() {
    if (result.isEmpty) {
      // start new expression
      result += '0.';
      startNewExp = false;
    } else {
      // add to current expression
      result += '.';
      startNewExp = false;
    }
  }

  void delete() {
    if (result.isNotEmpty) {
      result = result.substring(0, result.length - 1);
    }
  }

  void sin() {
    if (startNewExp || result == "") {
      result = 'sin(';
    } else {
      result += 'sin(';
    }
    openParen = true;
    startNewExp = false;
  }

  void asin() {
    // TODO: change from asin to sin-1 (to display to user)
    // TODO: create function in evaluate() that replaces sin-1 to asin()
    if (startNewExp || result == "") {
      result = 'asin(';
    } else {
      result += 'asin(';
    }
    openParen = true;
    startNewExp = false;
  }

  void cos() {
    if (startNewExp || result == "") {
      result = 'cos(';
    } else {
      result += 'cos(';
    }
    openParen = true;
    startNewExp = false;
  }

  void tan() {
    if (startNewExp || result == "") {
      result = 'tan(';
    } else {
      result += 'tan(';
    }
    openParen = true;
    startNewExp = false;
  }

  void log() {
    if (startNewExp || result == "") {
      result = 'log(';
    } else {
      result += 'log(';
    }
    openParen = true;
    startNewExp = false;
  }

  void sqrt() {
    if (startNewExp || result == "") {
      result = '√(';
    } else {
      result += '√(';
    }
    openParen = true;
    startNewExp = false;
  }

  void pi() {
    if (startNewExp || result == "") {
      result = 'π';
    } else {
      result += 'π';
    }
    openParen = true;
    startNewExp = false;
  }

  void exponent() {
    if (startNewExp == false && result != "") {
      result += '^';
    }
  }

  void e() {
    if (startNewExp || result == "") {
      result = 'e';
    } else {
      result += 'e';
    }
    openParen = true;
    startNewExp = false;
  }

  void factorial() {
    if (result != "") {
      result += '!';
    }
  }

  numeric(int num) {
    if (startNewExp) {
      // start new expression
      result = num.toString();
      startNewExp = false;
    } else {
      // add to current expression
      result += num.toString();
    }
  }

  void evaluate() {
    if (soundEffects) {
      playSound();
    }

    // set to true, will return to false after evaluating
    invalid = true;

    if (result.isNotEmpty) {
      String nonformattedResult = result;
      result = result.replaceAll('x', '*'); // replace x with *, etc.
      result = formatLog(result); // format log
      result = formatPi(result); // formatting pi
      result = formatE(result); // format e
      result = formatSquareRoot(result); // formatting square root
      result = formatPercents(result); // formatting % signs
      result = formatParentheses(result); // format parentheses

      Parser p = Parser();
      Expression exp = p.parse(result);
      ContextModel cm = ContextModel();

      double eval = exp.evaluate(EvaluationType.REAL, cm);

      String finalResult = formatResult(eval);
      createHistoryItem(nonformattedResult, finalResult);
      result = finalResult;
    }
    invalid = false;
    startNewExp = true;
    openParen = false;
  }

  void playSound() async {
    await player.play(AssetSource('CowMoo.mp3'));
  }

  String formatLog(String str) {
    str = str.replaceAll('log(', 'log(10,');
    return str;
  }

  String formatPi(String str) {
    str = str.replaceAll('π', math.pi.toString());
    // TODO: if next to a number or parentheses, add multiplication sign
    return str;
  }

  String formatE(String str) {
    str = str.replaceAll('e', math.e.toString());
    // TODO: if next to a number or parentheses, add multiplication sign
    return str;
  }

  String formatSquareRoot(String str) {
    str = str.replaceAll('√', 'sqrt');
    // TODO: if no close parentheses add one
    return str;
  }

  String formatPercents(String str) {
    while (str.contains('%')) {
      final index = str.indexOf('%', 0);

      // get numeric characters before percent sign
      String strNum = '';
      int i = index - 1;
      while (i >= 0 && double.tryParse(str[i]) != null) {
        strNum = str[i] + strNum;
        i--;
      }
      double num = double.parse(strNum);

      // divide number by 100
      num = num / 100;

      if (index == str.length - 1) {
        // replace number+percent with decimal value
        str = str.replaceFirst(strNum + '%', num.toString());
      } else {
        // if a number comes after % sign, add multiplication sign
        if (double.tryParse(str[index + 1]) != null) {
          str = str.substring(0, index + 1) + "*" + str.substring(index + 1);
        }
        str = str.replaceFirst(strNum + '%', num.toString());
      }
    }

    return str;
  }

  String formatParentheses(String str) {
    int i = 0;
    while (i < str.length) {
      if (str[i] == '(') {
        if (i - 1 >= 0 &&
            // check if number or ) comes directly before it
            (double.tryParse(str[i - 1]) != null || str[i - 1] == ')')) {
          // add * before parentheses
          str = str.substring(0, i) + "*" + str.substring(i);
        }
      }
      if (str[i] == ')') {
        if (i + 1 < str.length &&
            // check if number or ( comes directly after it
            (double.tryParse(str[i + 1]) != null || str[i + 1] == '(')) {
          // add * after parentheses
          str = str.substring(0, i + 1) + "*" + str.substring(i + 1);
        }
      }

      i++;
    }
    return str;
  }

  String formatResult(double input) {
    String str = "";

    str = input.toStringAsFixed(input.truncateToDouble() == input ? 0 : 10);
    // TODO: change this?
    // TODO: fix zeros

    RegExp regex = RegExp(r'/\.0+$/');
    str = str.replaceAll(regex, '');

    return str;
  }

  void createHistoryItem(String expression, String result) {
    DateTime now = DateTime.now().toLocal();
    String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(now);
    String item = formattedDate + ' ' + expression + '=' + result;
    storage.addHistoryItem(item);
  }
} // end of Calculator class
