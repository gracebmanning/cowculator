import 'package:cowculator/components/buttons.dart';
import 'package:cowculator/components/globals.dart';
import 'package:cowculator/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/appbar.dart';
import 'components/colors.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cowculator',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Main(color: pink),
      routes: {
        '/main/': (context) => Main(color: pink),
        '/settings/': (context) => Settings(color: currentColor)
      },
    );
  }
}

class Main extends StatefulWidget {
  Main({Key? key, required this.color}) : super(key: key);
  Color color;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int result = 0;
  String evalString = "";
  String displayString = "";
  bool finished = false;
  bool openParen = false;
  bool containsDecimal = false;

  _clear() {
    setState(() {
      displayString = "";
      evalString = "";
      openParen = false;
      containsDecimal = false;
      finished = true;
    });
  }

  _parentheses() {
    setState(() {
      if (openParen) {
        displayString += ')';
        evalString += ')';
        openParen = false;
      } else {
        displayString += '(';
        evalString += '(';
        openParen = true;
      }
    });
  }

  _percent() {
    setState(() {
      displayString += '%';
      evalString += '%'; // is this correct?
    });
  }

  _divide() {
    setState(() {
      displayString += '/';
      evalString += '/';
    });
  }

  _multiply() {
    setState(() {
      displayString += 'x';
      evalString += '*';
    });
  }

  _subtract() {
    setState(() {
      displayString += '-';
      evalString += '-';
    });
  }

  _add() {
    setState(() {
      displayString += '+';
      evalString += '+';
    });
  }

  _decimal() {
    setState(() {
      displayString += '.';
      evalString += '.';
      containsDecimal = true;
    });
  }

  _delete() {
    if (displayString.isNotEmpty) {
      setState(() {
        displayString = displayString.substring(0, displayString.length - 1);
      });
    }
  }

  _numeric(int num) {
    setState(() {
      if (finished) {
        // start new expression
        finished = false;
        displayString = num.toString();
        evalString = num.toString();
      } else {
        // add to current expression
        displayString += num.toString();
        evalString += num.toString();
      }
    });
  }

  _evaluate() {
    Parser p = Parser();
    Expression exp = p.parse(evalString);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      if (containsDecimal) {
        displayString = eval.toString();
      } else {
        displayString = eval.toInt().toString();
      }
      finished = true;
      openParen = false;
      containsDecimal = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MainAppbar(
          title: const Text("Cowculator"),
          color: widget.color,
          action: IconButton(
              icon: Image.asset('assets/images/settings.png'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Settings(color: widget.color)),
                    (route) => false);
              }),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    displayString,
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: [
                  // first row
                  OperatorButton(text: "CLR", action: _clear),
                  OperatorButton(text: "( )", action: _parentheses),
                  OperatorIconButton(
                    icon: const Icon(CupertinoIcons.percent, size: 40),
                    action: _percent,
                  ),
                  OperatorIconButton(
                    icon: const Icon(CupertinoIcons.divide, size: 40),
                    action: _divide,
                  ),
                  // second row
                  NumButton(text: "7", action: _numeric),
                  NumButton(text: "8", action: _numeric),
                  NumButton(text: "9", action: _numeric),
                  OperatorIconButton(
                    icon: const Icon(CupertinoIcons.multiply, size: 40),
                    action: _multiply,
                  ),
                  // third row
                  NumButton(text: "4", action: _numeric),
                  NumButton(text: "5", action: _numeric),
                  NumButton(text: "6", action: _numeric),
                  OperatorIconButton(
                    icon: const Icon(CupertinoIcons.minus, size: 40),
                    action: _subtract,
                  ),
                  // fourth row
                  NumButton(text: "1", action: _numeric),
                  NumButton(text: "2", action: _numeric),
                  NumButton(text: "3", action: _numeric),
                  OperatorIconButton(
                    icon: const Icon(CupertinoIcons.plus, size: 40),
                    action: _add,
                  ),
                  // fifth row
                  NumButton(text: "0", action: _numeric),
                  OperatorButton(
                    text: ".",
                    action: _decimal,
                  ),
                  OperatorIconButton(
                    icon: const Icon(CupertinoIcons.delete_left, size: 40),
                    action: _delete,
                  ),
                  OperatorIconButton(
                    icon: const Icon(CupertinoIcons.equal, size: 40),
                    action: _evaluate,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
