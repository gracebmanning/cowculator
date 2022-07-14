import 'package:cowculator/history.dart';
import 'package:cowculator/main.dart';
import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'components/colorbuttons.dart';
import 'custompagebuilder.dart';
import 'localstorage.dart';
import 'constants/colors.dart';
import 'constants/icons.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  LocalStorage storage = LocalStorage();
  Color color = pink;
  bool soundEffects = true;
  String toggleLabel = "On";
  Icon toggleIcon = toggleRight;

  @override
  void initState() {
    super.initState();
    () async {
      int i = await storage.getColor();
      bool val = await storage.getSoundEffects();
      setState(() {
        color = numbersToColors[i] ?? pink;
        // OFF toggleLeft, ON toggleRight
        soundEffects = val;
        toggleLabel = soundEffects ? "On" : "Off";
        toggleIcon = soundEffects ? toggleRight : toggleLeft;
      });
    }();
  }

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
      storage.setSoundEffects(soundEffects);
    });
  }

  _setColor(Color newColor) {
    setState(() {
      color = newColor;
      storage.setColor(colorsToNumbers[newColor] ?? 0);
    });
  }

  _viewHistory() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => History()), (route) => false);
  }

  _viewMain() {
    Navigator.of(context).push(CustomPageRoute(child: Main()));
    //Navigator.pushAndRemoveUntil(context,
        //MaterialPageRoute(builder: (context) => Main()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SettingsAppbar(
          title: "SETTINGS",
          color: color,
          leading: IconButton(
              icon: backArrow,
              onPressed: () {
                _viewMain();
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
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("View results history",
                      style: TextStyle(fontSize: 25)),
                  IconButton(icon: file, onPressed: _viewHistory),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 200, right: 30),
                child: Text("2022 \u00a9 GBM Studio.",
                    style: TextStyle(fontSize: 17))),
          ],
        ),
      ),
    );
  }
}
