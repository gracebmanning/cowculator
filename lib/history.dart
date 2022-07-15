import 'package:cowculator/settings.dart';
import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'constants/colors.dart';
import 'constants/icons.dart';
import 'custompagebuilder.dart';
import 'localstorage.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  LocalStorage storage = LocalStorage();
  Color color = pink;
  List<String> history = [];

  @override
  void initState() {
    super.initState();
    () async {
      int i = await storage.getColor();
      List<String> temp = await storage.getHistoryList();
      setState(() {
        color = numbersToColors[i] ?? pink;
        history = temp;
      });
    }();
  }

  _viewSettings() {
    Navigator.of(context).push(PageFromLeft(child: const Settings()));
  }

  _clearHistory() {
    setState(() {
      () async {
        storage.clearHistory();
        List<String> temp = await storage.getHistoryList();
        setState(() {
          history = temp;
        });
      }();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: HistoryAppbar(
          title: "HISTORY",
          color: color,
          leading: IconButton(
              icon: backArrow,
              onPressed: () {
                _viewSettings();
              }),
          action: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: const [
                    Text('CLEAR', style: TextStyle(fontSize: 15)),
                    Text('HISTORY', style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
              IconButton(
                  icon: clearFile,
                  onPressed: () {
                    _clearHistory();
                  })
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        // if history is empty, build list. else, display "Nothing to see here!".
        child: history.isNotEmpty
            ? Container(
                alignment: Alignment.topCenter,
                height: 90 * history.length.toDouble(),
                child: ListView.builder(
                    reverse: true,
                    itemCount: history.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        constraints: const BoxConstraints(minHeight: 40),
                        decoration: BoxDecoration(
                            border: Border.all(color: color, width: 1.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(history[index],
                              style: const TextStyle(fontSize: 22)),
                        ),
                      );
                    }),
              )
            : const Text('Nothing to see here!',
                style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
