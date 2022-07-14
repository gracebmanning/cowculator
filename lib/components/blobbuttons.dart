import 'package:cowculator/constants/blobs.dart';
import 'package:cowculator/constants/colors.dart';
import 'package:cowculator/constants/platformconstants.dart';
import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  OperatorButton(
      {Key? key, required this.text, required this.action, required this.color})
      : super(key: key);
  String text;
  dynamic action;
  Color color;

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();

    return Blob.fromID(
      id: const ['15-9-890934'],
      size: getOperatorButtonSize(),
      styles: BlobStyles(color: color, fillType: BlobFillType.stroke),
      controller: blobCtrl,
      child: TextButton(
        child: Text(
          text,
          style:
              TextStyle(fontSize: 27, color: (color == brown) ? brown : black),
        ),
        onPressed: () {
          action(text);
        },
      ),
    );
  }
}

class OperatorIconButton extends StatelessWidget {
  OperatorIconButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.action,
      required this.color})
      : super(key: key);
  String text;
  final Icon icon;
  dynamic action;
  Color color;

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();

    return Blob.fromID(
      id: const ['15-9-890934'],
      size: getOperatorButtonSize(),
      styles: BlobStyles(color: color, fillType: BlobFillType.stroke),
      controller: blobCtrl,
      child: TextButton(
        style: TextButton.styleFrom(primary: (color == brown) ? brown : black),
        child: icon,
        onPressed: () {
          action(text);
        },
      ),
    );
  }
}

class NumButton extends StatelessWidget {
  NumButton(
      {Key? key, required this.text, required this.action, required this.color})
      : super(key: key);
  String text;
  dynamic action;
  Color color;

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();

    return Blob.fromID(
      id: blobs[int.parse(text)],
      size: getNumButtonSize(),
      styles: BlobStyles(color: color),
      controller: blobCtrl,
      child: TextButton(
        child: Text(
          text,
          style: const TextStyle(fontSize: 35, color: white),
        ),
        onPressed: () {
          action(text);
        },
      ),
    );
  }
}
