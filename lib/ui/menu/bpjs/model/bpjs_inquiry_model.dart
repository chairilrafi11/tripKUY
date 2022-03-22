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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = act;
    data['van'] = van;
    data['numbers'] = numbers;
    data['auth_token'] = authToken;
    return data;
  }
}
