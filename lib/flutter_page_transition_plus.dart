library flutter_page_transitionx;

import 'package:flutter/material.dart';
import 'package:flutter_page_transition_plus/src/transitions/flutter_page_route_transition.dart';

export 'src/transitions/flutter_page_route_transition.dart';
export 'src/transitions/flutter_route_transition_mixin.dart';

class FlutterPageTransition {
  /// Usage:
  /// onGenerateRoute: (settings) => {
  ///   "/next": FlutterPageTransition.next(settings, NextPage());
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
  ///   "/zoom": FlutterPageTransition.zoom(settings, NextPage());
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
  ///   "/open/upwards": FlutterPageTransition.openUpwards(settings, NextPage());
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
  ///   "/fade/upwards": FlutterPageTransition.fadeUpwards(settings, NextPage());
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
