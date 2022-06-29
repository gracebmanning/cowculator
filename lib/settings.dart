import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/main/',
                (route) => false,
              );
            }),
        title: const Text("Settings"),
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
