import 'package:cowculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'components/appbar.dart';
import 'components/colorbuttons.dart';
import 'constants/colors.dart';
import 'constants/icons.dart';

class Settings extends StatefulWidget {
  Settings({Key? key, required this.color}) : super(key: key);
  Color color;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool soundEffects = true;
  String toggleLabel = "On";
  Icon toggleIcon = toggleRight;
  // OFF left, ON right

  _toggleSound() {
    setState(() {
      if (soundEffects) {
        soundEffects = false;
        toggleLabel = "Off";
        toggleIcon = toggleLeft;
      } else {
        soundEffects = true;
        toggleLabel = "On";
        toggleIcon = toggleRight;
      }
    });
  }

  _setColor(Color newColor) {
    setState(() {
      widget.color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SettingsAppbar(
          title: "SETTINGS",
          color: widget.color,
          leading: IconButton(
              icon: backArrow,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Main(color: widget.color)),
                    (route) => false);
              }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 130, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // color theme
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Color theme", style: TextStyle(fontSize: 25)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColorButton(color: pink, action: _setColor),
                    ColorButton(color: blue, action: _setColor),
                    ColorButton(color: green, action: _setColor),
                    ColorButton(color: yellow, action: _setColor),
                    ColorButton(color: brown, action: _setColor),
                    ColorButton(color: black, action: _setColor)
                  ],
                ),
              ],
            ),
            // sound effects
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sound effects: $toggleLabel",
                      style: const TextStyle(fontSize: 25)),
                  IconButton(icon: toggleIcon, onPressed: _toggleSound),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
