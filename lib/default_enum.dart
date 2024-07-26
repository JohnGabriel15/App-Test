enum PaymentCardStatus {
  definingPaymentValue,
  completingPayment,
}

//payment enums
enum TypeOrderNote {
  paymentNote,
  productionNote,
  ticketNote,
  balance,
  fiscalNote,
  picPayNote
}

class PagSeguroInstallmentsType {
  static const installmentTypeVista = 1;
  static const installmentTypeParcVendedor = 2;
  static const installmentTypeParcComprador = 3;
}

class PaymentStatus {
  static const canceled = 0;
  static const pending = 1;
  static const aproved = 2;
}

enum PaymentNoteType {
  charge, // via de cobrança, ANTES do pagamento
  receipt, // via de recibo, DEPOIS do pagamento
}

class PixPaymentRequestSmartPos {
  int value;

  PixPaymentRequestSmartPos({required this.value});

  Map toJson() {
    var json = {
      "value": value,
    };

    json.keys
        .where((k) => json[k] == null) // filter keys
        .toList() // create a copy to avoid concurrent modifications
        .forEach(json.remove);

    return json;
  }
}

class MethodsChannel {
  static const print = "print";
  static const readNFC = "readNFC";
  static const writeNFC = "writeNFC";
  static const transactionCard = "transactionCard";
  static const transactionPix = "transactionPix";
  static const initializeAndActivatePinpad = "initializeAndActivatePinpad";
  static const lastTransaction = "lastTransaction";
  static const disableTerminal = "disableTerminal";
  static const abortOperatiom = "abort";
  static const cancelPayment = "cancelPayment";
}

enum OrderSourceEnum { smartpag, ifood }

enum Action { confirm, cancel, add, remove }

enum PaymentPageType {
  credit,
  debit,
  money,
  picPay,
  detailsPayment,
  voucher,
  undefined,
  pix,
  other
}
