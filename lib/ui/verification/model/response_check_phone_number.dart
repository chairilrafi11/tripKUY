class ResponseCheckPhoneNumber {
  int? id;
  String? phoneNumber;

  ResponseCheckPhoneNumber({this.id, this.phoneNumber});

  ResponseCheckPhoneNumber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
