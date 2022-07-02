import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MainAppbar extends StatelessWidget {
  MainAppbar({Key? key, required this.title, required this.color, this.action})
      : super(key: key);
  String title;
  Color color;
  dynamic action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: const TextStyle(fontSize: 25, fontFamily: 'Inconsolata')),
      backgroundColor: color,
      foregroundColor: (color == black || color == brown) ? white : black,
      actions: [action],
      elevation: 0,
    );
  }
}

class SettingsAppbar extends StatelessWidget {
  SettingsAppbar(
      {Key? key, required this.title, required this.color, this.leading})
      : super(key: key);
  String title;
  Color color;
  dynamic leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontSize: 25)),
      backgroundColor: color,
      foregroundColor: (color == black || color == brown) ? white : black,
      leading: leading,
      elevation: 0,
    );
  }
}

// flutter pub get new_gradient_app_bar to use
/*class MainAppbarGradient extends StatelessWidget {
  MainAppbarGradient(
      {Key? key, required this.title, required this.color, this.action})
      : super(key: key);
  String title;
  Color color;
  dynamic action;

  @override
  Widget build(BuildContext context) {
    return NewGradientAppBar(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 25,
            fontFamily: 'Inconsolata',
            color: (color == black || color == brown) ? white : black),
      ),
      actions: [action],
      elevation: 0,
      gradient: LinearGradient(
        colors: [
          color,
          color.withOpacity(0.5),
          color.withOpacity(0.7),
          color.withOpacity(0.8),
          color.withOpacity(0.9),
          white,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
      ),
    );
  }
}*/