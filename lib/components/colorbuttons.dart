import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({Key? key, required this.color, required this.action})
      : super(key: key);
  final Color color;
  final dynamic action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 5),
      child: SizedBox(
        width: 40,
        child: MaterialButton(
          color: color,
          shape: const CircleBorder(),
          elevation: 0,
          onPressed: () {
            action(color);
          },
        ),
      ),
    );
  }
}
