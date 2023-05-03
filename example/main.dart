import 'package:flutter/material.dart';
import 'package:flutter_page_transition_plus/flutter_page_transition_plus.dart';

import 'custom_page_transitions_builder.dart';

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
        "/next": FlutterPageTransition.next(
          settings,
          const NextPage(),
        ),
        "/zoom": FlutterPageTransition.zoom(
          settings,
          const NextPage(),
        ),
        "/open/upwards": FlutterPageTransition.openUpwards(
          settings,
          const NextPage(),
        ),
        "/fade/upwards": FlutterPageTransition.fadeUpwards(
          settings,
          const NextPage(),
        ),
        "/custom": FlutterPageTransition.custom(
          settings,
          const NextPage(),
          CustomPageTransitionsBuilder(),
          performOutgoingAnimation: false,
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
