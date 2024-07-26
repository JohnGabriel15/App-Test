import 'package:nativo_apps/default_enum.dart';

class FileNameImagemSingleton {
  int countPaymentNote = 0;
  int countProductionNote = 0;
  int countTicketNote = 0;
  int countBalance = 0;
  int countFiscal = 0;
  int picPayNote = 0;

  FileNameImagemSingleton._privateConstructor();

  static final FileNameImagemSingleton _instance =
      FileNameImagemSingleton._privateConstructor();

  factory FileNameImagemSingleton() {
    return _instance;
  }

  String getFileName(TypeOrderNote typeOrderNote) {
    int? current;
    switch (typeOrderNote) {
      case TypeOrderNote.paymentNote:
        current = countPaymentNote;
        countPaymentNote = (countPaymentNote + 1) % 10;
        break;
      case TypeOrderNote.productionNote:
        current = countProductionNote;
        countProductionNote = (countProductionNote + 1) % 10;
        break;
      case TypeOrderNote.ticketNote:
        current = countTicketNote;
        countTicketNote = (countTicketNote + 1) % 10;
        break;
      case TypeOrderNote.balance:
        current = countBalance;
        countBalance = (countBalance + 1) % 10;
        break;
      case TypeOrderNote.fiscalNote:
        current = countFiscal;
        countFiscal = (countFiscal + 1) % 10;
        break;
      case TypeOrderNote.picPayNote:
        current = countFiscal;
        countFiscal = (countFiscal + 1) % 10;
        break;
      default:
    }
    return "${typeOrderNote.toString().split('.')[1]}_$current.jpg";
  }
}
