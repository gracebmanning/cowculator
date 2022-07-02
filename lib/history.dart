import 'package:cowculator/settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/appbar.dart';
import 'constants/icons.dart';

class History extends StatefulWidget {
  History({Key? key, required this.color, required this.soundEffects})
      : super(key: key);
  Color color;
  bool soundEffects;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SettingsAppbar(
          title: "HISTORY",
          color: widget.color,
          leading: IconButton(
              icon: backArrow,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Settings(
                              color: widget.color,
                              soundEffects: widget.soundEffects,
                            )),
                    (route) => false);
              }),
        ),
      ),
      body: Column(),
    );
  }
}
