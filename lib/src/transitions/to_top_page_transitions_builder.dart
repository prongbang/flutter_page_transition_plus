import 'package:flutter/material.dart';

class ToTopPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;

    var tween = Tween(
      begin: begin,
      end: end,
    ).chain(CurveTween(
      curve: Curves.ease,
    ));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
