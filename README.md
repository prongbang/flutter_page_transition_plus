# flutter_page_transitions

## Feature

- Next Transition

```dart
FlutterPageTransitions.next(settings, NextPage());
```

- Zoom Transition

```dart
FlutterPageTransitions.zoom(settings, NextPage());
```

- Open Upwards Transition

```dart
FlutterPageTransitions.openUpwards(settings, NextPage());
```

- Fade Upwards Transition

```dart
FlutterPageTransitions.fadeUpwards(settings, NextPage());
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
import 'package:flutter_page_transitions/flutter_page_transitions.dart';

class NextPage extends StatelessWidget { }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NextPage(),
      onGenerateRoute: (settings) => {
        "/next": FlutterPageTransitions.next(settings, NextPage()),
        "/zoom": FlutterPageTransitions.zoom(settings, NextPage()),
        "/open/upwards": FlutterPageTransitions.openUpwards(settings, NextPage()),
        "/fade/upwards": FlutterPageTransitions.fadeUpwards(settings, NextPage()),
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