import 'package:cowculator/components/buttons.dart';
import 'package:cowculator/settings.dart';
import 'package:flutter/material.dart';

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
      home: const Main(),
      routes: {
        '/main/': (context) => const Main(),
        '/settings/': (context) => const Settings()
      },
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int result = 0;

  void _incrementCounter() {
    setState(() {
      result++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cowculator"),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/settings/',
                  (route) => false,
                );
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '$result',
                    style: Theme.of(context).textTheme.headline4,
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
                children: const [
                  // first row
                  OperatorButton(text: "AC"),
                  OperatorButton(text: "( )"),
                  OperatorButton(text: "%"),
                  OperatorButton(text: "/"),
                  // second row
                  NumButton(text: "7"),
                  NumButton(text: "8"),
                  NumButton(text: "9"),
                  OperatorButton(text: "X"),
                  // third row
                  NumButton(text: "4"),
                  NumButton(text: "5"),
                  NumButton(text: "6"),
                  OperatorButton(text: "-"),
                  // fourth row
                  NumButton(text: "1"),
                  NumButton(text: "2"),
                  NumButton(text: "3"),
                  OperatorButton(text: "+"),
                  // fifth row
                  NumButton(text: "0"),
                  OperatorButton(text: "."),
                  OperatorButton(text: "DEL"),
                  OperatorButton(text: "="),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
