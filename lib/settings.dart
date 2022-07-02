import 'package:cowculator/history.dart';
import 'package:cowculator/main.dart';
import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'components/colorbuttons.dart';
import 'constants/colors.dart';
import 'constants/icons.dart';

class Settings extends StatefulWidget {
  Settings({Key? key, required this.color, required this.soundEffects})
      : super(key: key);
  Color color;
  bool soundEffects;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late String toggleLabel = widget.soundEffects ? "On" : "Off";
  late Icon toggleIcon = widget.soundEffects ? toggleRight : toggleLeft;
  // OFF left, ON right

  _viewMain() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Main(color: widget.color, soundEffects: widget.soundEffects)),
        (route) => false);
  }

  _toggleSound() {
    setState(() {
      if (widget.soundEffects) {
        widget.soundEffects = false;
        toggleLabel = "Off";
        toggleIcon = toggleLeft;
      } else {
        widget.soundEffects = true;
        toggleLabel = "On";
        toggleIcon = toggleRight;
      }
    });
  }

  _viewHistory() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => History(
                  color: widget.color,
                  soundEffects: widget.soundEffects,
                )),
        (route) => false);
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
          ],
        ),
      ),
    );
  }
}
