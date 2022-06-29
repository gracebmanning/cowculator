import 'package:cowculator/components/colors.dart';
import 'package:cowculator/components/custom_clip.dart';
import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  const OperatorButton({Key? key, required this.text, this.action})
      : super(key: key);
  final String text;
  final void action;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
      ),
      child: Text(text, style: const TextStyle(fontSize: 20)),
      onPressed: () {
        action;
      },
    );
  }
}

class NumButton extends StatelessWidget {
  const NumButton({Key? key, required this.text, this.action})
      : super(key: key);
  final String text;
  final void action;

  @override
  Widget build(BuildContext context) {
    /*
    return IconButton(
      //icon: Image.asset('assets/images/blob.png'),

      /*
      icon: ClipPath(
        clipper: MyClip(),
        child: Container(
          color: Colors.pink,
          height: 150,
          width: 150,
        ),
      ), */
      iconSize: 50,
      onPressed: () {
        action;
      },
    ); */

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: white,
        backgroundColor: pink,
      ),
      child: Text(text, style: const TextStyle(fontSize: 20)),
      onPressed: () {
        action;
      },
    );
  }
}
