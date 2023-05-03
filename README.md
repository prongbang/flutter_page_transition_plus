# flutter_page_transition_plus

Flutter custom page transitions builder

## Get Started

It is really easy to use!
You should ensure that you add the `flutter_page_transition_plus` as a dependency in your flutter project.

```yaml
dependencies:
  flutter_page_transition_plus: "^1.0.2"
```

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

FlutterPageTransition.custom(settings, NextPage(), CustomPageTransitionsBuilder());
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:flutter_page_transition_plus/flutter_page_transition_plus.dart';

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
        "/custom": FlutterPageTransition.custom(settings, NextPage(), CustomPageTransitionsBuilder()),
      }[settings.name],
    );
  }
}
```