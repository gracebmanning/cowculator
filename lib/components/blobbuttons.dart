import 'package:cowculator/constants/blobs.dart';
import 'package:cowculator/constants/colors.dart';
import 'package:cowculator/constants/platformconstants.dart';
import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

/////////////////////////////////
////// FULL SIZE BUTTONS ///////
///////////////////////////////
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

    return Align(
      alignment: Alignment.center,
      child: Blob.fromID(
        id: const ['15-9-890934'],
        size: getOperatorButtonSize(),
        styles: BlobStyles(color: color, fillType: BlobFillType.stroke),
        controller: blobCtrl,
        child: TextButton(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, color: (color == brown) ? brown : black),
          ),
          onPressed: () {
            action(text);
          },
        ),
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

    return Align(
      alignment: Alignment.center,
      child: Blob.fromID(
        id: const ['15-9-890934'],
        size: getOperatorButtonSize(),
        styles: BlobStyles(color: color, fillType: BlobFillType.stroke),
        controller: blobCtrl,
        child: TextButton(
          style:
              TextButton.styleFrom(primary: (color == brown) ? brown : black),
          child: icon,
          onPressed: () {
            action(text);
          },
        ),
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

    return Align(
      alignment: Alignment.center,
      child: Blob.fromID(
        id: blobs[int.parse(text)],
        size: getNumButtonSize(),
        styles: BlobStyles(color: color),
        controller: blobCtrl,
        child: TextButton(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 35, color: white),
          ),
          onPressed: () {
            action(text);
          },
        ),
      ),
    );
  }
}

/////////////////////////////////
//////// MINI BUTTONS //////////
///////////////////////////////
class OperatorButtonMini extends StatelessWidget {
  OperatorButtonMini(
      {Key? key, required this.text, required this.action, required this.color})
      : super(key: key);
  String text;
  dynamic action;
  Color color;

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();

    return Align(
      alignment: Alignment.center,
      child: Blob.fromID(
        id: const ['15-9-890934'],
        size: getOperatorButtonSize(mini: true),
        styles: BlobStyles(color: color, fillType: BlobFillType.fill),
        controller: blobCtrl,
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17, color: (color == brown) ? brown : black),
            ),
            onPressed: () {
              action(text);
            },
          ),
        ),
      ),
    );
  }
}

class OperatorIconButtonMini extends StatelessWidget {
  OperatorIconButtonMini(
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

    return Align(
      alignment: Alignment.center,
      child: Blob.fromID(
        id: const ['15-9-890934'],
        size: getOperatorButtonSize(mini: true),
        styles: BlobStyles(color: color, fillType: BlobFillType.fill),
        controller: blobCtrl,
        child: TextButton(
          style:
              TextButton.styleFrom(primary: (color == brown) ? brown : black),
          child: icon,
          onPressed: () {
            action(text);
          },
        ),
      ),
    );
  }
}
