import 'package:flutter/material.dart';

class MainAppbar extends StatefulWidget {
  MainAppbar({Key? key, required this.title, required this.color, this.action})
      : super(key: key);
  String title;
  Color color;
  final action;

  @override
  State<MainAppbar> createState() => _MainAppbarState();
}

class _MainAppbarState extends State<MainAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title,
          style: const TextStyle(fontSize: 25, fontFamily: 'Inconsolata')),
      backgroundColor: widget.color,
      actions: [widget.action],
    );
  }
}

class SettingsAppbar extends StatefulWidget {
  SettingsAppbar(
      {Key? key, required this.title, required this.color, this.leading})
      : super(key: key);
  String title;
  Color color;
  final leading;

  @override
  State<SettingsAppbar> createState() => _SettingsAppbarState();
}

class _SettingsAppbarState extends State<SettingsAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(widget.title,
            style: const TextStyle(fontSize: 25, fontFamily: 'Inconsolata')),
        backgroundColor: widget.color,
        leading: widget.leading);
  }
}
