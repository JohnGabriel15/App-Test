import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nativo_apps/images_print_widget/hero_dialog_route.dart';

abstract class NavigatorPushModal {
  static Future<T> push<T>(Widget modal, {bool autoClose = false}) async {
    return await Modular.to.push(HeroDialogRoute(
        barrierDismissible: false,
        opaque: false,
        barrierColor: Colors.blue.withOpacity(0.9),
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: modal,
            ),
          );
        },
        settings: null));
  }
}
