class PGNInquiryResponse {
  String? respCode;
  String? rcm;
  String? refnum;
  String? idPel;
  String? nama;
  int? jmlBln;
  String? bulanTagihan;
  int? amount;
  int? admin;
  int? total;
  String? daya;
  int? jmlBlnTagihan;
  int? transactionId;

  PGNInquiryResponse({
    this.respCode,
    this.rcm,
    this.refnum,
    this.idPel,
    this.nama,
    this.jmlBln,
    this.bulanTagihan,
    this.amount,
    this.admin,
    this.total,
    this.daya,
    this.jmlBlnTagihan,
    this.transactionId
  });

  PGNInquiryResponse.fromJson(Map<String, dynamic> json) {
    respCode = json['resp_code'];
    rcm = json['rcm'];
    refnum = json['refnum'];
    idPel = json['id_pel'];
    nama = json['nama'];
    jmlBln = json['jml_bln'];
    bulanTagihan = json['bulan_tagihan'];
    amount = json['amount'];
    admin = json['admin'];
    total = json['total'];
    daya = json['daya'];
    jmlBlnTagihan = json['jml_bln_tagihan'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp_code'] = respCode;
    data['rcm'] = rcm;
    data['refnum'] = refnum;
    data['id_pel'] = idPel;
    data['nama'] = nama;
    data['jml_bln'] = jmlBln;
    data['bulan_tagihan'] = bulanTagihan;
    data['amount'] = amount;
    data['admin'] = admin;
    data['total'] = total;
    data['daya'] = daya;
    data['jml_bln_tagihan'] = jmlBlnTagihan;
    data['transaction_id'] = transactionId;
    return data;
  }
}
