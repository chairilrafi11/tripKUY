class ResponseCheckPhoneNumber {
  int? id;
  String? phoneNumber;

  ResponseCheckPhoneNumber({this.id, this.phoneNumber});

  ResponseCheckPhoneNumber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
