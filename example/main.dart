import 'package:flutter/material.dart';
import 'package:flutter_page_transition_plus/flutter_page_transition_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NextPage(),
      onGenerateRoute: (settings) => {
        "/next": FlutterPageTransition.next(settings, const NextPage()),
        "/zoom": FlutterPageTransition.zoom(settings, const NextPage()),
        "/open/upwards":
            FlutterPageTransition.openUpwards(settings, const NextPage()),
        "/fade/upwards":
            FlutterPageTransition.fadeUpwards(settings, const NextPage()),
        "/custom": FlutterPageRouteTransition(
          builder: (_) => const NextPage(),
          settings: settings,
          transitionsBuilder: CustomPageTransitionsBuilder(),
        ),
      }[settings.name],
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container();
}

class CustomPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _CustomPageTransition(routeAnimation: animation, child: child);
  }
}

class _CustomPageTransition extends StatelessWidget {
  _CustomPageTransition({
    Key? key,
    required Animation<double> routeAnimation,
    required this.child,
  })  : _positionAnimation =
            routeAnimation.drive(_bottomUpTween.chain(_fastOutSlowInTween)),
        _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
      CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final Animation<Offset> _positionAnimation;
  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _positionAnimation,
      child: FadeTransition(opacity: _opacityAnimation, child: child),
    );
  }
}
