import 'package:flutter/material.dart';

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(75.9 * _xScaling, 24.9 * _yScaling);
    path.cubicTo(
      84.1 * _xScaling,
      32.2 * _yScaling,
      91.5 * _xScaling,
      41.1 * _yScaling,
      92.7 * _xScaling,
      51.2 * _yScaling,
    );
    path.cubicTo(
      93.9 * _xScaling,
      61.3 * _yScaling,
      88.9 * _xScaling,
      72.7 * _yScaling,
      80.8 * _xScaling,
      80.5 * _yScaling,
    );
    path.cubicTo(
      72.7 * _xScaling,
      88.3 * _yScaling,
      61.3 * _xScaling,
      92.7 * _yScaling,
      50.9 * _xScaling,
      91.8 * _yScaling,
    );
    path.cubicTo(
      40.5 * _xScaling,
      90.8 * _yScaling,
      31 * _xScaling,
      84.7 * _yScaling,
      23.6 * _xScaling,
      76.9 * _yScaling,
    );
    path.cubicTo(
      16.200000000000003 * _xScaling,
      69 * _yScaling,
      10.799999999999997 * _xScaling,
      59.5 * _yScaling,
      11.200000000000003 * _xScaling,
      50.4 * _yScaling,
    );
    path.cubicTo(
      11.600000000000001 * _xScaling,
      41.2 * _yScaling,
      17.6 * _xScaling,
      32.4 * _yScaling,
      25 * _xScaling,
      25.1 * _yScaling,
    );
    path.cubicTo(
      32.4 * _xScaling,
      17.700000000000003 * _yScaling,
      41.2 * _xScaling,
      11.799999999999997 * _yScaling,
      50 * _xScaling,
      11.700000000000003 * _yScaling,
    );
    path.cubicTo(
      58.9 * _xScaling,
      11.700000000000003 * _yScaling,
      67.8 * _xScaling,
      17.5 * _yScaling,
      75.9 * _xScaling,
      24.9 * _yScaling,
    );
    path.cubicTo(
      75.9 * _xScaling,
      24.9 * _yScaling,
      75.9 * _xScaling,
      24.9 * _yScaling,
      75.9 * _xScaling,
      24.9 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
