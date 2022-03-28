class ElectricPospaidInquiryResponse {
  String? idPel;
  String? nama;
  String? rcm;
  String? jmlBln;
  int? amount;
  dynamic jmlBlnTagihan;
  int? total;
  int? admin;
  String? daya;
  String? refnum;
  String? plnToken;
  String? respCode;
  dynamic transactionId;

  ElectricPospaidInquiryResponse({
    this.idPel,
    this.nama,
    this.rcm,
    this.jmlBln,
    this.amount,
    this.jmlBlnTagihan,
    this.total,
    this.admin,
    this.daya,
    this.refnum,
    this.plnToken,
    this.respCode,
    this.transactionId
  });

  ElectricPospaidInquiryResponse.fromJson(Map<String, dynamic> json) {
    idPel = json['id_pel'];
    nama = json['nama'];
    rcm = json['rcm'];
    jmlBln = json['jml_bln'];
    amount = json['amount'];
    jmlBlnTagihan = json['jml_bln_tagihan'];
    total = json['total'];
    admin = json['admin'];
    daya = json['daya'];
    refnum = json['refnum'];
    plnToken = json['pln_token'];
    respCode = json['resp_code'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_pel'] = idPel;
    data['nama'] = nama;
    data['rcm'] = rcm;
    data['jml_bln'] = jmlBln;
    data['amount'] = amount;
    data['jml_bln_tagihan'] = jmlBlnTagihan;
    data['total'] = total;
    data['admin'] = admin;
    data['daya'] = daya;
    data['refnum'] = refnum;
    data['pln_token'] = plnToken;
    data['resp_code'] = respCode;
    data['transaction_id'] = transactionId;
    return data;
  }
}
