import 'package:cowculator/components/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  const OperatorButton({Key? key, required this.text, this.action})
      : super(key: key);
  final String text;
  final action;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        shape: const CircleBorder(),
        side: const BorderSide(color: pink, width: 2.5),
      ),
      child: Text(text, style: const TextStyle(fontSize: 25)),
      onPressed: () {
        action();
      },
    );
  }
}

class OperatorIconButton extends StatelessWidget {
  const OperatorIconButton({Key? key, required this.icon, this.action})
      : super(key: key);
  final icon;
  final action;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: black,
        shape: const CircleBorder(),
        side: const BorderSide(color: pink, width: 2.5),
      ),
      child: icon,
      onPressed: () {
        action();
      },
    );
  }
}

class NumButton extends StatelessWidget {
  const NumButton({Key? key, required this.text, this.action})
      : super(key: key);
  final String text;
  final action;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: white,
        backgroundColor: pink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        side: const BorderSide(width: 2, color: pink),
      ),
      child: Text(text, style: const TextStyle(fontSize: 30)),
      onPressed: () {
        action(int.parse(text));
      },
    );
  }
}
