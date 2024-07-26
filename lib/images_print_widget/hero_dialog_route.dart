import 'package:flutter/material.dart';

/// CRED: https://github.com/funwithflutter/flutter_ui_tips/tree/master/tip_003_popup_card

/// {@template hero_dialog_route}
/// Custom [PageRoute] that creates an overlay dialog (popup effect).
///
/// Best used with a [Hero] animation.
/// {@endtemplate}
class HeroDialogRoute<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
  HeroDialogRoute(
      {required WidgetBuilder builder,
      RouteSettings? settings,
      bool fullscreenDialog = false,
      bool barrierDismissible = true,
      bool opaque = false,
      Color barrierColor = Colors.grey})
      : _builder = builder,
        _barrierDismissible = barrierDismissible,
        _barrierColor = barrierColor,
        _opaque = opaque,
        super(settings: settings);

  final WidgetBuilder _builder;
  final bool _barrierDismissible;

  final Color _barrierColor;
  final bool _opaque;

  @override
  bool get opaque => _opaque;

  @override
  bool get barrierDismissible => _barrierDismissible;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => _barrierColor;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => '';
}
