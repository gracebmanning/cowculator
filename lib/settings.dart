import 'package:cowculator/main.dart';
import 'package:flutter/material.dart';

import 'components/appbar.dart';

class Settings extends StatefulWidget {
  Settings({Key? key, required this.color}) : super(key: key);
  Color color;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SettingsAppbar(
          title: const Text("Settings"),
          color: widget.color,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Main(color: widget.color)),
                    (route) => false);
              }),
        ),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Nothing to see here folks!",
                style: TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }
}
