import 'components/buttons.dart';
import 'components/globals.dart';
import 'components/appbar.dart';
import 'components/colors.dart';
import 'components/icons.dart';
import 'settings.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Inconsolata'),
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
          title: "COWCULATOR",
          color: widget.color,
          action: IconButton(
              icon: settings,
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
                  OperatorButton(
                      text: "CLR", action: _clear, color: widget.color),
                  OperatorButton(
                      text: "( )", action: _parentheses, color: widget.color),
                  OperatorIconButton(
                      icon: percent, action: _percent, color: widget.color),
                  OperatorIconButton(
                      icon: divide, action: _divide, color: widget.color),
                  // second row
                  NumButton(text: "7", action: _numeric, color: widget.color),
                  NumButton(text: "8", action: _numeric, color: widget.color),
                  NumButton(text: "9", action: _numeric, color: widget.color),
                  OperatorIconButton(
                      icon: multiply, action: _multiply, color: widget.color),
                  // third row
                  NumButton(text: "4", action: _numeric, color: widget.color),
                  NumButton(text: "5", action: _numeric, color: widget.color),
                  NumButton(text: "6", action: _numeric, color: widget.color),
                  OperatorIconButton(
                      icon: minus, action: _subtract, color: widget.color),
                  // fourth row
                  NumButton(text: "1", action: _numeric, color: widget.color),
                  NumButton(text: "2", action: _numeric, color: widget.color),
                  NumButton(text: "3", action: _numeric, color: widget.color),
                  OperatorIconButton(
                      icon: plus, action: _add, color: widget.color),
                  // fifth row
                  NumButton(text: "0", action: _numeric, color: widget.color),
                  OperatorButton(
                      text: ".", action: _decimal, color: widget.color),
                  OperatorIconButton(
                      icon: delete, action: _delete, color: widget.color),
                  OperatorIconButton(
                      icon: equal, action: _evaluate, color: widget.color),
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
