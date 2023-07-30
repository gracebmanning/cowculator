import 'package:flutter/services.dart';
import 'custompagebuilder.dart';
import 'localstorage.dart';
import 'calculator.dart';
import 'history.dart';
import 'settings.dart';
import 'components/blobbuttons.dart';
import 'components/appbar.dart';
import 'constants/colors.dart';
import 'constants/icons.dart';
import 'constants/platformconstants.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cowculator',
      theme: ThemeData(primaryColor: Colors.black, fontFamily: 'Inconsolata'),
      home: const Main(),
      routes: {
        '/main/': (context) => const Main(),
        '/settings/': (context) => const Settings(),
        '/history/': (context) => const History()
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
  LocalStorage storage = LocalStorage();
  Color color = pink;
  late Calculator c = Calculator();
  String displayString = "";
  bool invalid = false;
  bool inverted = false;

  @override
  void initState() {
    super.initState();
    () async {
      int i = await storage.getColor();
      setState(() {
        color = numbersToColors[i] ?? pink;
      });
    }();
  }

  _update(String val) {
    c.input(val);
    setState(() {
      displayString = c.getResult();
      invalid = c.getInvalid();
    });
  }

  _invert(String val) {
    setState(() {
      if (inverted) {
        inverted = false;
      } else {
        inverted = true;
      }
    });
  }

  _viewSettings() {
    Navigator.of(context).push(PageFromRight(child: const Settings()));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getAppbarHeight()),
        child: MainAppbar(
          title: "COWCULATOR",
          color: color,
          action: IconButton(
              icon: settings,
              color: (color == black || color == brown) ? white : black,
              onPressed: () {
                _viewSettings();
              }),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: transparents[color],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(invalid ? 'INVALID' : ''),
                            Text(
                              displayString,
                              style: const TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                  crossAxisCount: 6,
                  children: [
                    // top row - small buttons
                    OperatorButtonMini(
                        text: inverted ? "SIN-1" : "SIN",
                        action: _update,
                        color: color),
                    OperatorButtonMini(
                        text: inverted ? "COS-1" : "COS",
                        action: _update,
                        color: color),
                    OperatorButtonMini(
                        text: inverted ? "TAN-1" : "TAN",
                        action: _update,
                        color: color),
                    OperatorButtonMini(
                        text: inverted ? "LN" : "LOG",
                        action: _update,
                        color: color),
                    OperatorButtonMini(
                        text: inverted ? "x^2" : "√",
                        action: _update,
                        color: color),
                    OperatorButtonMini(
                        text: "INV", action: _invert, color: color),

                    // bottom row - small buttons
                    OperatorButtonMini(
                        text: "π", action: _update, color: color),
                    OperatorButtonMini(
                        text: "^", action: _update, color: color),
                    OperatorButtonMini(
                        text: "e", action: _update, color: color),
                    OperatorButtonMini(
                        text: "!", action: _update, color: color),
                    OperatorButtonMini(
                        text: "(", action: _update, color: color),
                    OperatorButtonMini(
                        text: ")", action: _update, color: color),
                  ]),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: GridView.count(
                  primary: false,
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  crossAxisSpacing: 15,
                  mainAxisSpacing:
                      // main axis spacing is dependent on screen height
                      getMainAxisSpacing(MediaQuery.of(context).size.height),
                  crossAxisCount: 4,
                  children: [
                    // first row
                    OperatorButton(text: "CLR", action: _update, color: color),
                    OperatorButton(text: "MEM", action: _update, color: color),
                    OperatorIconButton(
                        text: "%",
                        icon: percent,
                        action: _update,
                        color: color),
                    OperatorIconButton(
                        text: "/", icon: divide, action: _update, color: color),
                    // second row
                    NumButton(text: "7", action: _update, color: color),
                    NumButton(text: "8", action: _update, color: color),
                    NumButton(text: "9", action: _update, color: color),
                    OperatorIconButton(
                        text: "X",
                        icon: multiply,
                        action: _update,
                        color: color),
                    // third row
                    NumButton(text: "4", action: _update, color: color),
                    NumButton(text: "5", action: _update, color: color),
                    NumButton(text: "6", action: _update, color: color),
                    OperatorIconButton(
                        text: "-", icon: minus, action: _update, color: color),
                    // fourth row
                    NumButton(text: "1", action: _update, color: color),
                    NumButton(text: "2", action: _update, color: color),
                    NumButton(text: "3", action: _update, color: color),
                    OperatorIconButton(
                        text: "+", icon: plus, action: _update, color: color),
                    // fifth row
                    NumButton(text: "0", action: _update, color: color),
                    OperatorButton(text: ".", action: _update, color: color),
                    OperatorIconButton(
                        text: "DEL",
                        icon: delete,
                        action: _update,
                        color: color),
                    OperatorIconButton(
                        text: "=", icon: equal, action: _update, color: color),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
