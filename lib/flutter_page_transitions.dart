library flutter_page_transitions;

import 'package:flutter/material.dart';
import 'package:flutter_page_transitions/src/transitions/flutter_page_route_transition.dart';

export 'src/transitions/flutter_page_route_transition.dart';
export 'src/transitions/flutter_route_transition_mixin.dart';

class FlutterPageTransitions {
  /// Usage:
  /// onGenerateRoute: (settings) => {
  ///   "/next": FlutterPageTransitions.next(settings, NextPage());
  /// }
  static Route<dynamic> next(RouteSettings settings, Widget widget) {
    return _pageRouteTransition(
      widget: widget,
      settings: settings,
      transitionsBuilder: const CupertinoPageTransitionsBuilder(),
    );
  }

  /// Usage:
  /// onGenerateRoute: (settings) => {
  ///   "/zoom": FlutterPageTransitions.zoom(settings, NextPage());
  /// }
  static Route<dynamic> zoom(RouteSettings settings, Widget widget) {
    return _pageRouteTransition(
      widget: widget,
      settings: settings,
      transitionsBuilder: const ZoomPageTransitionsBuilder(),
    );
  }

  /// Usage:
  /// onGenerateRoute: (settings) => {
  ///   "/open/upwards": FlutterPageTransitions.openUpwards(settings, NextPage());
  /// }
  static Route<dynamic> openUpwards(RouteSettings settings, Widget widget) {
    return _pageRouteTransition(
      widget: widget,
      settings: settings,
      transitionsBuilder: const OpenUpwardsPageTransitionsBuilder(),
    );
  }

  /// Usage:
  /// onGenerateRoute: (settings) => {
  ///   "/fade/upwards": FlutterPageTransitions.fadeUpwards(settings, NextPage());
  /// }
  static Route<dynamic> fadeUpwards(RouteSettings settings, Widget widget) {
    return _pageRouteTransition(
      widget: widget,
      settings: settings,
      transitionsBuilder: const FadeUpwardsPageTransitionsBuilder(),
    );
  }

  static Route<dynamic> _pageRouteTransition({
    required RouteSettings settings,
    required Widget widget,
    required PageTransitionsBuilder transitionsBuilder,
  }) =>
      FlutterPageRouteTransition(
        builder: (_) => widget,
        settings: settings,
        transitionsBuilder: transitionsBuilder,
      );
}
