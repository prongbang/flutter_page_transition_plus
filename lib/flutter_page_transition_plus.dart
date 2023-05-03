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
  static Route<dynamic> next(
    RouteSettings settings,
    Widget widget, {
    bool performOutgoingAnimation = true,
  }) {
    return _pageRouteTransition(
      widget: widget,
      settings: settings,
      transitionsBuilder: const CupertinoPageTransitionsBuilder(),
      performOutgoingAnimation: performOutgoingAnimation,
    );
  }

  /// Usage:
  /// onGenerateRoute: (settings) => {
  ///   "/zoom": FlutterPageTransition.zoom(settings, NextPage());
  /// }
  static Route<dynamic> zoom(
    RouteSettings settings,
    Widget widget, {
    bool performOutgoingAnimation = true,
  }) {
    return _pageRouteTransition(
      widget: widget,
      settings: settings,
      transitionsBuilder: const ZoomPageTransitionsBuilder(),
      performOutgoingAnimation: performOutgoingAnimation,
    );
  }

  /// Usage:
  /// onGenerateRoute: (settings) => {
  ///   "/open/upwards": FlutterPageTransition.openUpwards(settings, NextPage());
  /// }
  static Route<dynamic> openUpwards(
    RouteSettings settings,
    Widget widget, {
    bool performOutgoingAnimation = true,
  }) {
    return _pageRouteTransition(
      widget: widget,
      settings: settings,
      transitionsBuilder: const OpenUpwardsPageTransitionsBuilder(),
      performOutgoingAnimation: performOutgoingAnimation,
    );
  }

  /// Usage:
  /// onGenerateRoute: (settings) => {
  ///   "/fade/upwards": FlutterPageTransition.fadeUpwards(settings, NextPage());
  /// }
  static Route<dynamic> fadeUpwards(
    RouteSettings settings,
    Widget widget, {
    bool performOutgoingAnimation = true,
  }) {
    return _pageRouteTransition(
      widget: widget,
      settings: settings,
      transitionsBuilder: const FadeUpwardsPageTransitionsBuilder(),
      performOutgoingAnimation: performOutgoingAnimation,
    );
  }

  /// Usage:
  /// onGenerateRoute: (settings) => {
  ///   "/custom": FlutterPageTransition.custom(settings, NextPage(), CustomPageTransitionsBuilder());
  /// }
  static Route<dynamic> custom(
    RouteSettings settings,
    Widget widget,
    PageTransitionsBuilder transitionsBuilder, {
    bool performOutgoingAnimation = true,
  }) {
    return _pageRouteTransition(
      widget: widget,
      settings: settings,
      transitionsBuilder: transitionsBuilder,
      performOutgoingAnimation: performOutgoingAnimation,
    );
  }

  static Route<dynamic> _pageRouteTransition({
    required RouteSettings settings,
    required Widget widget,
    required PageTransitionsBuilder transitionsBuilder,
    bool performOutgoingAnimation = true,
  }) =>
      FlutterPageRouteTransition(
        builder: (_) => widget,
        settings: settings,
        transitionsBuilder: transitionsBuilder,
        performOutgoingAnimation: performOutgoingAnimation,
      );
}
