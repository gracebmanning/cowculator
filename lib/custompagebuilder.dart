import 'package:flutter/material.dart';

class PageFromLeft extends PageRouteBuilder {
  final Widget child;

  PageFromLeft({
    required this.child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 160),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
}

class PageFromRight extends PageRouteBuilder {
  final Widget child;

  PageFromRight({
    required this.child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 160),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
}
