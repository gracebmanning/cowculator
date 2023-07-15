import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:audioplayers/audioplayers.dart';
import 'localstorage.dart';
import 'dart:math' as math;

class Calculator {
  String result = "";
  String lastResult = "";
  bool startNewExp = false;
  int openParenCount = 0;
  bool invalid = false;
  AudioPlayer player = AudioPlayer();

  LocalStorage storage = LocalStorage();
  bool soundEffects = true;

  // initialize calculator with soundEffects value.
  Calculator() {
    () async {
      // sound effects
      bool val = await storage.getSoundEffects();
      soundEffects = val;
      // last result from history
      String historyString = await storage.getLastHistoryItem();
      lastResult = historyString;
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
      case "MEM":
        {
          memory();
          break;
        }
      case "(":
        {
          openParen();
          break;
        }
      case ")":
        {
          closedParen();
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
      case "ACOS":
        {
          acos();
          break;
        }
      case "TAN":
        {
          tan();
          break;
        }
      case "ATAN":
        {
          atan();
          break;
        }
      case "LOG":
        {
          log();
          break;
        }
      case "LN":
        {
          ln();
          break;
        }
      case "√":
        {
          sqrt();
          break;
        }
      case "x^2":
        {
          squared();
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
    openParenCount = 0;
    invalid = false;
  }

  void memory() {
    if (startNewExp || result == "") {
      // if none, result = "no items available" ?
      result = lastResult;
    } else {
      result += lastResult;
    }
  }

  void openParen() {
    if (startNewExp) {
      // start new expression
      result = '(';
      startNewExp = false;
    } else {
      // add to current expression
      result += '(';
    }
    openParenCount++;
  }

  void closedParen() {
    if (startNewExp) {
      // start new expression
      result = ')';
      startNewExp = false;
    } else {
      // add to current expression
      result += ')';
    }
    openParenCount--;
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
    openParenCount++;
    startNewExp = false;
  }

  void asin() {
    if (startNewExp || result == "") {
      result = 'arcsin(';
    } else {
      result += 'arcsin(';
    }
    openParenCount++;
    startNewExp = false;
  }

  void cos() {
    if (startNewExp || result == "") {
      result = 'cos(';
    } else {
      result += 'cos(';
    }
    openParenCount++;
    startNewExp = false;
  }

  void acos() {
    if (startNewExp || result == "") {
      result = 'arccos(';
    } else {
      result += 'arccos(';
    }
    openParenCount++;
    startNewExp = false;
  }

  void tan() {
    if (startNewExp || result == "") {
      result = 'tan(';
    } else {
      result += 'tan(';
    }
    openParenCount++;
    startNewExp = false;
  }

  void atan() {
    if (startNewExp || result == "") {
      result = 'arctan(';
    } else {
      result += 'arctan(';
    }
    openParenCount++;
    startNewExp = false;
  }

  void log() {
    if (startNewExp || result == "") {
      result = 'log(';
    } else {
      result += 'log(';
    }
    openParenCount++;
    startNewExp = false;
  }

  void ln() {
    if (startNewExp || result == "") {
      result = 'ln(';
    } else {
      result += 'ln(';
    }
    openParenCount++;
    startNewExp = false;
  }

  void sqrt() {
    if (startNewExp || result == "") {
      result = '√(';
    } else {
      result += '√(';
    }
    openParenCount++;
    startNewExp = false;
  }

  void squared() {
    result += '^2';
    startNewExp = false;
  }

  void pi() {
    if (startNewExp || result == "") {
      result = 'π';
    } else {
      result += 'π';
    }
    startNewExp = false;
  }

  void exponent() {
    result += '^';
    startNewExp = false;
  }

  void e() {
    if (startNewExp || result == "") {
      result = 'e';
    } else {
      result += 'e';
    }
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
      lastResult = finalResult;
    }
    invalid = false;
    startNewExp = true;
    openParenCount = 0;
  }

  void playSound() async {
    await player.play(AssetSource('CowMoo.mp3'));
  }

  String formatLog(String str) {
    str = str.replaceAll('log(', 'log(10,');
    return str;
  }

  String formatPi(String str) {
    int i = 0;
    while (i < str.length) {
      if (str[i] == 'π') {
        if (i - 1 >= 0 &&
            // check if number or ) comes directly before it
            (double.tryParse(str[i - 1]) != null || str[i - 1] == ')')) {
          // add * before pi
          str = str.substring(0, i) + "*" + str.substring(i);
        }
      }
      i++;
    }
    str = str.replaceAll('π', math.pi.toString());
    return str;
  }

  String formatE(String str) {
    int i = 0;
    while (i < str.length) {
      if (str[i] == 'e') {
        if (i - 1 >= 0 &&
            // check if number or ) comes directly before it
            (double.tryParse(str[i - 1]) != null || str[i - 1] == ')')) {
          // add * before e
          str = str.substring(0, i) + "*" + str.substring(i);
        }
      }
      i++;
    }
    str = str.replaceAll('e', math.e.toString());
    return str;
  }

  String formatSquareRoot(String str) {
    str = str.replaceAll('√', 'sqrt');
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


// code to format square root parentheses from sqrt(4 to sqrt(4)
// FLAW: only works with single-value operands. Does not work with something like sqrt(4*5)
/*
    int index = 0;
    int len = str.length;
    while (index < len) {
      // if at sqrt...
      if (str[index] == 's' &&
          index + 1 < str.length &&
          str[index + 1] == 'q') {
        int i = index + 5;

        // if no close parentheses, add one at next operator
        while (i < str.length) {
          if (str[i] == ')') {
            break;
          } else if (double.tryParse(str[i]) == null) {
            // get to a non-numerical value
            if (i == str.length - 1) {
              str += ')';
            } else {
              str = str.substring(0, i) + ')' + str.substring(i);
            }
            break;
          } else if (i == str.length - 1) {
            str += ')';
          }
          i++;
        }
      }
      index++;
      len = str.length;
    }
    */