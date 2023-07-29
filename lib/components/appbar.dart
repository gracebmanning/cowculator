import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar(
      {Key? key,
      required this.title,
      required this.color,
      required this.action})
      : super(key: key);
  final String title;
  final Color color;
  final dynamic action;

  @override
  Widget build(BuildContext context) {
    var textColor = black;
    if (color == brown || color == black) {
      textColor = white;
    } else if (color == yellow) {
      textColor = brown;
    }

    return AppBar(
      title: Text(title,
          style: const TextStyle(fontSize: 27, fontFamily: 'Inconsolata')),
      backgroundColor: color,
      foregroundColor: textColor,
      actions: [action],
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }
}

class SettingsAppbar extends StatelessWidget {
  const SettingsAppbar(
      {Key? key, required this.title, required this.color, this.leading})
      : super(key: key);
  final String title;
  final Color color;
  final dynamic leading;

  @override
  Widget build(BuildContext context) {
    var textColor = black;
    if (color == brown || color == black) {
      textColor = white;
    } else if (color == yellow) {
      textColor = brown;
    }

    return AppBar(
      title: Text(title, style: const TextStyle(fontSize: 25)),
      backgroundColor: color,
      foregroundColor: textColor,
      leading: leading,
      elevation: 0,
    );
  }
}

class HistoryAppbar extends StatelessWidget {
  const HistoryAppbar(
      {Key? key,
      required this.title,
      required this.color,
      required this.leading,
      required this.action})
      : super(key: key);
  final String title;
  final Color color;
  final dynamic leading;
  final dynamic action;

  @override
  Widget build(BuildContext context) {
    var textColor = black;
    if (color == brown || color == black) {
      textColor = white;
    } else if (color == yellow) {
      textColor = brown;
    }

    return AppBar(
      title: Text(title, style: const TextStyle(fontSize: 25)),
      backgroundColor: color,
      foregroundColor: textColor,
      leading: leading,
      actions: [action],
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