import 'package:cowculator/constants/blobs.dart';
import 'package:cowculator/constants/colors.dart';
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
      size: 80,
      styles: BlobStyles(color: color, fillType: BlobFillType.stroke),
      controller: blobCtrl,
      child: TextButton(
        child: Text(
          text,
          style: const TextStyle(fontSize: 25, color: black),
        ),
        onPressed: () {
          action();
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
      size: 85,
      styles: BlobStyles(color: color),
      controller: blobCtrl,
      child: TextButton(
        child: Text(
          text,
          style: const TextStyle(fontSize: 30, color: white),
        ),
        onPressed: () {
          action(int.parse(text));
        },
      ),
    );
  }
}
