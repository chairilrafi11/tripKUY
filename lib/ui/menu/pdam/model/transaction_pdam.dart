class TransactionPDAM {
  String? pin;
  String? act;
  String? balance = 'cash';
  String? id;
  String? totalPayment;
  String? product;
  int? productId;
  int? transactionId;

  TransactionPDAM(
      {this.act,
        this.id,
        this.product,
        this.productId,
        this.totalPayment,
        this.pin,
        this.transactionId = 0});

  TransactionPDAM.fromJson(Map<String, dynamic> json) {
    act = json['act'];
    id = json['id'];
    product = json['product'];
    productId = json['product_id'];
    totalPayment = json['total_payment'];
    pin = json['pin'];
    balance = json['balance'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = act;
    data['id'] = id;
    data['product'] = product;
    data['product_id'] = productId;
    data['total_payment'] = totalPayment;
    data['pin'] = pin;
    data['balance'] = balance;
    data['transaction_id'] = transactionId;
    return data;
  }
}
