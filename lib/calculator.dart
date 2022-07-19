import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:audioplayers/audioplayers.dart';
import 'localstorage.dart';

class Calculator {
  String result = "";
  bool startNewExp = false;
  bool openParen = false;
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
    startNewExp = true;
    openParen = false;
  }

  void parentheses() {
    if (startNewExp) {
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

  void delete() {
    if (result.isNotEmpty) {
      result = result.substring(0, result.length - 1);
    }
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

    if (result.isNotEmpty) {
      String nonformattedResult = result;
      // process string input
      result = result.replaceAll('x', '*'); // replace x with *, etc.
      // formatting % signs
      result = formatPercents(result);
      // format parentheses as multiplication signs
      result = formatParentheses(result);

      Parser p = Parser();
      Expression exp = p.parse(result);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      String finalResult = formatResult(eval);
      createHistoryItem(nonformattedResult, finalResult);

      result = finalResult;
    }
    startNewExp = true;
    openParen = false;
  }

  void playSound() async {
    await player.play(AssetSource('CowMoo.mp3'));
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

    if (input.isInfinite) {
      str = input.toStringAsFixed(input.truncateToDouble() == input ? 0 : 6);
    } else {
      str = input.toStringAsFixed(input.truncateToDouble() == input ? 0 : 4);
    }

    RegExp regex = RegExp(r'([.]*0+)(?!.*\d)');
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
