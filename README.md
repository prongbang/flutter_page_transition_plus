# flutter_page_transition_plus

## Feature

- Next Transition

```dart
FlutterPageTransition.next(settings, NextPage());
```

- Zoom Transition

```dart
FlutterPageTransition.zoom(settings, NextPage());
```

- Open Upwards Transition

```dart
FlutterPageTransition.openUpwards(settings, NextPage());
```

- Fade Upwards Transition

```dart
FlutterPageTransition.fadeUpwards(settings, NextPage());
```

- Custom Transition

```dart
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

FlutterPageRouteTransition(
    builder: (_) => const NextPage(),
    settings: settings,
    transitionsBuilder: const CustomPageTransitionsBuilder(),
);
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:flutter_page_transition_plus/flutter_page_transition.dart';

class NextPage extends StatelessWidget { }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NextPage(),
      onGenerateRoute: (settings) => {
        "/next": FlutterPageTransition.next(settings, NextPage()),
        "/zoom": FlutterPageTransition.zoom(settings, NextPage()),
        "/open/upwards": FlutterPageTransition.openUpwards(settings, NextPage()),
        "/fade/upwards": FlutterPageTransition.fadeUpwards(settings, NextPage()),
        "/custom": FlutterPageRouteTransition(
          builder: (_) => NextPage(),
          settings: settings,
          transitionsBuilder: CustomPageTransitionsBuilder(),
        ),
      }[settings.name],
    );
  }
}
```