import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nativo_apps/images_print_widget/widget_to_image.dart';
import 'dart:ui' as ui;

class BaseToPrintWidget {
  static var count = 0;
  static Future<Uint8List> createPngToPrintByWidget(
      Widget child, context) async {
    GlobalKey key1 = GlobalKey(debugLabel: 'Qrcode-Widget');
    showDialog(
      context: context,
      builder: (con) => SizedBox(
        child: Stack(
          children: [
            WidgetToImage(
              builder: (key) {
                key1 = key;
                return SingleChildScrollView(child: child);
              },
            ),
            Material(
              child: SizedBox(
                height: 700,
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/images/impressora.gif',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });

    while (key1.currentContext == null || count == 100) {
      count++;
      createPngToPrintByWidget(child, context);
    }

    RenderRepaintBoundary boundary =
        key1.currentContext!.findRenderObject() as RenderRepaintBoundary;

    // if (boundary.debugNeedsPaint) {
    //   print("Waiting for boundary to be painted.");
    //   await Future.delayed(const Duration(milliseconds: 20));
    //   return createPngToPrintByWidget(child);
    // }

    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  }

  static saveImageOnMachine(
      {required String fileName, required Uint8List image}) {
    File file = File('/storage/emulated/0/Download/$fileName');
    file.writeAsBytesSync(
      image,
    );
  }
}
