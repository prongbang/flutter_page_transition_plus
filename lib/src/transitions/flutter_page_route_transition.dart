import 'package:flutter/material.dart';
import 'package:flutter_page_transition_plus/src/transitions/flutter_route_transition_mixin.dart';

class FlutterPageRouteTransition<T> extends PageRoute<T>
    with FlutterRouteTransitionMixin<T> {
  /// Construct a FlutterPageRouteTransition whose contents are defined by [builder].
  ///
  /// The values of [builder], [transitionsBuilder], [maintainState], and [PageRoute.fullscreenDialog] must not be null.
  FlutterPageRouteTransition({
    required this.builder,
    required this.transitionsBuilder,
    RouteSettings? settings,
    this.maintainState = true,
    this.performOutgoingAnimation = true,
    bool fullscreenDialog = false,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog) {
    assert(opaque);
  }

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  /// Builds the transition od the page.
  final PageTransitionsBuilder transitionsBuilder;

  /// Enabled perform outgoing animation if the next route is a fullscreen dialog.
  bool performOutgoingAnimation;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  PageTransitionsBuilder pageTransitionsBuilder() => transitionsBuilder;

  @override
  final bool maintainState;

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';

  @override
  bool customCanTransitionTo(TransitionRoute<dynamic> nextRoute) {
    if (performOutgoingAnimation) {
      return (nextRoute is FlutterRouteTransitionMixin &&
          !nextRoute.fullscreenDialog);
    }
    return false;
  }
}
