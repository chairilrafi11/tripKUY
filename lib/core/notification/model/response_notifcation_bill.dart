class ResponseNotificationBill {
  Data? data;
  int? typeId;
  int? categoryNotif;
  String? title;
  String? body;

  ResponseNotificationBill({this.data, this.typeId, this.categoryNotif, this.title, this.body});

  ResponseNotificationBill.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    typeId = json['type_id'];
    categoryNotif = json['category_notif'];
    title = json['data_title'];
    body = json['data_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['type_id'] = typeId;
    data['category_notif'] = categoryNotif;
    data['data_title'] = title;
    data['data_body'] = body;
    return data;
  }
}

class Data {
  String? transactionCode;
  int? transactionStatus;
  int? id;

  Data({this.transactionCode, this.transactionStatus, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    transactionCode = json['transaction_code'];
    transactionStatus = json['transaction_status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_code'] = transactionCode;
    data['transaction_status'] = transactionStatus;
    data['id'] = id;
    return data;
  }
}
