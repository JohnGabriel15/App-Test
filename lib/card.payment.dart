class CardPayment {
  int installments;
  int value;
  int paymentType;

  CardPayment(
      {required this.installments,
      required this.value,
      required this.paymentType});

  Map toJson() {
    var json = {
      "installments": installments,
      "value": value,
      "paymentType": paymentType
    };

    json.keys
        .where((k) => json[k] == null) // filter keys
        .toList() // create a copy to avoid concurrent modifications
        .forEach(json.remove);

    return json;
  }
}
