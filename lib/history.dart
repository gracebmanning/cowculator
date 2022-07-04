import 'package:cowculator/settings.dart';
import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'constants/colors.dart';
import 'constants/icons.dart';
import 'localstorage.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SettingsAppbar(
          title: "HISTORY",
          color: color,
          leading: IconButton(
              icon: backArrow,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                    (route) => false);
              }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        // if history is empty, build list. else, display "Nothing to see here!".
        child: history.isNotEmpty
            ? ListView.builder(
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
                })
            : const Text('Nothing to see here!',
                style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
