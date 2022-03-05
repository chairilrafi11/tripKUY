class BPJSInquiryModel {
  String? act;
  String? van;
  String? numbers;
  String? authToken;

  BPJSInquiryModel({this.act, this.van, this.numbers, this.authToken});

  BPJSInquiryModel.fromJson(Map<String, dynamic> json) {
    act = json['act'];
    van = json['van'];
    numbers = json['numbers'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act'] = this.act;
    data['van'] = this.van;
    data['numbers'] = this.numbers;
    data['auth_token'] = this.authToken;
    return data;
  }
}
