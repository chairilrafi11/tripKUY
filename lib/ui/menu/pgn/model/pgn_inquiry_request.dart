class PGNInquiryRequest {
  String? act;
  String? id;
  String? totalPayment;
  String? authToken;

  PGNInquiryRequest({this.act, this.id, this.totalPayment, this.authToken});

  PGNInquiryRequest.fromJson(Map<String, dynamic> json) {
    act = json['act'];
    id = json['id'];
    totalPayment = json['total_payment'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = act;
    data['id'] = id;
    data['total_payment'] = totalPayment;
    data['auth_token'] = authToken;
    return data;
  }
}
