class ElectricPrepaidInquiryResponse {
  String? idPel;
  String? nama;
  String? rcm;
  String? tarifdaya;
  int? amount;
  String? admin;
  String? refnum;
  String? plnToken;
  dynamic transactionId;

  ElectricPrepaidInquiryResponse({
    this.idPel,
    this.nama,
    this.rcm,
    this.tarifdaya,
    this.amount,
    this.admin,
    this.refnum,
    this.plnToken,
    this.transactionId
  });

  ElectricPrepaidInquiryResponse.fromJson(Map<String, dynamic> json) {
    idPel = json['id_pel'];
    nama = json['nama'];
    rcm = json['rcm'];
    tarifdaya = json['tarifdaya'];
    amount = json['amount'];
    admin = json['admin'];
    refnum = json['refnum'];
    plnToken = json['pln_token'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_pel'] = idPel;
    data['nama'] = nama;
    data['rcm'] = rcm;
    data['tarifdaya'] = tarifdaya;
    data['amount'] = amount;
    data['admin'] = admin;
    data['refnum'] = refnum;
    data['pln_token'] = plnToken;
    data['transaction_id'] = transactionId;
    return data;
  }
}
