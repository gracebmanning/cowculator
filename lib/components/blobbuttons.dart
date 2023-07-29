import 'dart:ui';

import 'package:cowculator/constants/blobs.dart';
import 'package:cowculator/constants/colors.dart';
import 'package:cowculator/constants/platformconstants.dart';
import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

/////////////////////////////////
////// FULL SIZE BUTTONS ///////
///////////////////////////////
class OperatorButton extends StatelessWidget {
  const OperatorButton(
      {Key? key, required this.text, required this.action, required this.color})
      : super(key: key);
  final String text;
  final dynamic action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();

    var textColor = black;
    if (color == brown || color == yellow) {
      textColor = brown;
    }

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
            style: TextStyle(fontSize: 25, color: textColor),
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
  const OperatorIconButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.action,
      required this.color})
      : super(key: key);
  final String text;
  final Icon icon;
  final dynamic action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();

    var textColor = black;
    if (color == brown || color == yellow) {
      textColor = brown;
    }

    return Align(
      alignment: Alignment.center,
      child: Blob.fromID(
        id: const ['15-9-890934'],
        size: getOperatorButtonSize(),
        styles: BlobStyles(color: color, fillType: BlobFillType.stroke),
        controller: blobCtrl,
        child: TextButton(
          style: TextButton.styleFrom(foregroundColor: textColor),
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
  const NumButton(
      {Key? key, required this.text, required this.action, required this.color})
      : super(key: key);
  final String text;
  final dynamic action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    final textColor = (color == yellow) ? brown : white;

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
            style: TextStyle(fontSize: 35, color: textColor),
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
  const OperatorButtonMini(
      {Key? key, required this.text, required this.action, required this.color})
      : super(key: key);
  final String text;
  final dynamic action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();

    var textColor = black;
    if (color == brown || color == black) {
      textColor = white;
    } else if (color == yellow) {
      textColor = brown;
    }

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
            child: (text == "SIN-1" ||
                    text == "COS-1" ||
                    text == "TAN-1" ||
                    text == "x^2")
                ? text == "x^2" // text is x^2
                    ? Wrap(children: [
                        Text('x',
                            style: TextStyle(fontSize: 19, color: textColor)),
                        Text('2',
                            style: TextStyle(
                                fontSize: 19,
                                color: textColor,
                                fontFeatures: const [
                                  FontFeature.superscripts()
                                ])),
                      ])
                    // text is sin-1, cos-1, tan-1
                    : Wrap(children: [
                        Text(text.substring(0, 3),
                            style: TextStyle(fontSize: 17, color: textColor)),
                        Text('-1',
                            style: TextStyle(
                                fontSize: 14,
                                color: textColor,
                                fontFeatures: const [
                                  FontFeature.superscripts()
                                ])),
                      ])
                // text is not an invertable value
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19, color: textColor),
                  ),
            onPressed: () {
              if (text == "SIN-1" || text == "COS-1" || text == "TAN-1") {
                action('A' + text.substring(0, 3)); // passes asin, acos, atan
              } else {
                action(text);
              }
            },
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////
///////// NOT IN USE ///////////
///////////////////////////////
class OperatorIconButtonMini extends StatelessWidget {
  const OperatorIconButtonMini(
      {Key? key,
      required this.text,
      required this.icon,
      required this.action,
      required this.color})
      : super(key: key);
  final String text;
  final Icon icon;
  final dynamic action;
  final Color color;

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
          style: TextButton.styleFrom(
              foregroundColor: (color == brown) ? brown : black),
          child: icon,
          onPressed: () {
            action(text);
          },
        ),
      ),
    );
  }
}
