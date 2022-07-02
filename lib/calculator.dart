import 'package:math_expressions/math_expressions.dart';
import 'package:audioplayers/audioplayers.dart';

class Calculator {
  String result = "";
  bool startNewExp = false;
  bool openParen = false;
  AudioPlayer player = AudioPlayer();

  bool soundEffects;
  Calculator(this.soundEffects);

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
    startNewExp = false;
    openParen = false;
  }

  void parentheses() {
    if (result.isEmpty) {
      // start new expression
      result += '(';
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
      // process string input
      result = result.replaceAll('x', '*'); // replace x with *, etc.
      // formatting % signs
      result = formatPercents(result);

      Parser p = Parser();
      Expression exp = p.parse(result);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      result = formatResult(eval);
    }
    startNewExp = true;
    openParen = false;
  }

  void playSound() async {
    await player.play(AssetSource('CowMoo2.mp3'));
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

      // replace number+parentheses with decimal value
      // if more numbers come after % sign, add multiplication sign
      if (index == str.length - 1) {
        str = str.replaceFirst(strNum + '%', num.toString());
      } else {
        str = str.replaceFirst(strNum + '%', num.toString() + '*');
      }
    }

    return str;
  }

  String formatResult(double input) {
    String str = "";

    if (input.isInfinite) {
      str = input.toStringAsFixed(input.truncateToDouble() == input ? 0 : 6);
    } else {
      str = input.toStringAsFixed(input.truncateToDouble() == input ? 0 : 2);
    }
    return str;
  }
} // end of Calculator class
