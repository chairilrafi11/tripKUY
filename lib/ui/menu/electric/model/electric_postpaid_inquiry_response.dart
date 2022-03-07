class ElectricPospaidInquiryResponse {
  String? idPel;
  String? nama;
  String? rcm;
  String? jmlBln;
  int? amount;
  String? jmlBlnTagihan;
  int? total;
  int? admin;
  String? daya;
  String? refnum;
  String? plnToken;
  String? respCode;

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
    this.respCode
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pel'] = this.idPel;
    data['nama'] = this.nama;
    data['rcm'] = this.rcm;
    data['jml_bln'] = this.jmlBln;
    data['amount'] = this.amount;
    data['jml_bln_tagihan'] = this.jmlBlnTagihan;
    data['total'] = this.total;
    data['admin'] = this.admin;
    data['daya'] = this.daya;
    data['refnum'] = this.refnum;
    data['pln_token'] = this.plnToken;
    data['resp_code'] = this.respCode;
    return data;
  }
}
