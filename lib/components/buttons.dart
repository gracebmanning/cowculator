import 'package:cowculator/constants/blobs.dart';
import 'package:cowculator/constants/colors.dart';
import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class OperatorButtonRound extends StatelessWidget {
  OperatorButtonRound(
      {Key? key, required this.text, required this.action, required this.color})
      : super(key: key);
  final String text;
  dynamic action;
  Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        shape: const CircleBorder(),
        side: BorderSide(color: color, width: 2.5),
      ),
      child: Text(text, style: const TextStyle(fontSize: 25)),
      onPressed: () {
        action();
      },
    );
  }
}

class OperatorIconButtonRound extends StatelessWidget {
  OperatorIconButtonRound(
      {Key? key, required this.icon, required this.action, required this.color})
      : super(key: key);
  final Icon icon;
  dynamic action;
  Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: black,
        shape: const CircleBorder(),
        side: BorderSide(color: color, width: 2.5),
      ),
      child: icon,
      onPressed: () {
        action();
      },
    );
  }
}

class NumButtonRound extends StatelessWidget {
  NumButtonRound(
      {Key? key, required this.text, required this.action, required this.color})
      : super(key: key);
  final String text;
  dynamic action;
  Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: white,
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        side: BorderSide(width: 2, color: color),
      ),
      child: Text(text, style: const TextStyle(fontSize: 30)),
      onPressed: () {
        action(int.parse(text));
      },
    );
  }
}
