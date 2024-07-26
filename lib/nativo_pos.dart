import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:nativo_apps/card.payment.dart';
import 'package:nativo_apps/default_enum.dart';
import 'package:nativo_apps/file_name_image.dart';
import 'package:nativo_apps/images_print_widget/base_print_widget.dart';
import 'package:nativo_apps/images_print_widget/images/production_print_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class SmartPos {
  final platform = const MethodChannel('smartpay/smartpos');

  Future<String> orderNoteBuilder(context) async {
    String msgError = "Falha ao tentar criar o arquivo para impressão.";

    if (PermissionStatus.granted == PermissionStatus.granted) {
      // Permission is true
      FileNameImagemSingleton fileNameImagemSingleton =
          FileNameImagemSingleton();
      String fileName =
          fileNameImagemSingleton.getFileName(TypeOrderNote.productionNote);

      var image = await BaseToPrintWidget.createPngToPrintByWidget(
          const ProductionPrintWidget(), context);

      try {
        BaseToPrintWidget.saveImageOnMachine(fileName: fileName, image: image);
      } catch (e, s) {
        debugPrint("${e.toString()} + at stack: ${s.toString()}");

        rethrow;
      }
      return fileName;
    }
    throw Exception("smartPos.business.dart linha 53 $msgError");
  }

  Future<String> printOrderNote(String fileName) async {
    String printResult = "";
    try {
      final String result =
          await platform.invokeMethod('print', {"fileName": fileName});

      printResult += 'Impressao $fileName realizada com $result .\n';
    } on PlatformException catch (e, s) {
      debugPrint("${e.toString()} + at stack: ${s.toString()}");
      printResult += "Impressao $fileName falhou '${e.toString()}'.\n";

      debugPrint(printResult);
      throw Exception("Falha ao tentar imprimir.");
    }
    return printResult;
  }

  readNfc() {}

  writeNfc() {}

  Future<String> doLastTransacao() async {
    String resultFuture;
    try {
      final String result =
          await platform.invokeMethod(MethodsChannel.lastTransaction);
      resultFuture = result;
    } on PlatformException catch (e, s) {
      debugPrint("${e.toString()} + at stack: ${s.toString()}");
      resultFuture = "Falha: '${e.message}'.";
    }
    return resultFuture;
  }

  Future<String?> doAbortOperation() async {
    String? resultFuture;
    try {
      final String result =
          await platform.invokeMethod(MethodsChannel.abortOperatiom);
      resultFuture = result;
    } on PlatformException catch (e, s) {
      debugPrint("${e.toString()} + at stack: ${s.toString()}");
      resultFuture = "Falha: '${e.message}'.";
    } catch (erro) {
      debugPrint("Erro doAbortOperation() => $erro");
    }
    if (resultFuture != null) {
      return resultFuture;
    }
    return null;
  }

  Future<String> doCardPayment() async {
    var paymentTypeInt = 1;

    try {
      CardPayment cardPayment = CardPayment(
          installments: 1, value: 1500, paymentType: paymentTypeInt);

      return await platform.invokeMethod(
          MethodsChannel.transactionCard, cardPayment.toJson());
    } on PlatformException catch (e, s) {
      debugPrint("${e.toString()} + at stack: ${s.toString()}");
      throw e.toString();
    }
  }

  Future<String> doPixPayment(PixPaymentRequestSmartPos pixPayment) async {
    try {
      return await platform.invokeMethod(
          MethodsChannel.transactionPix, pixPayment.toJson());
    } on PlatformException catch (e, s) {
      debugPrint("${e.toString()} + at stack: ${s.toString()}");
      throw e.toString();
    }
  }

  Future<String> doCancelPayment(
      String transactionCode, String transactionId) async {
    try {
      var arguments = {
        "transactionCode": transactionCode,
        "transactionId": transactionId
      };

      return await platform.invokeMethod(
          MethodsChannel.transactionCard, arguments);
    } on PlatformException catch (e, s) {
      debugPrint("${e.toString()} + at stack: ${s.toString()}");
      throw e.toString();
    }
  }

  Future<String> disableTerminal() async {
    try {
      return await platform.invokeMethod(MethodsChannel.disableTerminal);
    } on PlatformException catch (e, s) {
      debugPrint("${e.toString()} + at stack: ${s.toString()}");
      return "Erro: '${e.message}'.";
    }
  }
}
