class BPJSInquiryResponse {
  dynamic noVa;
  String? nama;
  String? kdCabang;
  dynamic jmlPst;
  dynamic periode;
  int? tagihan;
  int? beaAdmin;
  int? totTagihan;
  int? totalPremi;
  int? bpjsBalance;
  dynamic reff;

  BPJSInquiryResponse({
    this.noVa,
    this.nama,
    this.kdCabang,
    this.jmlPst,
    this.periode,
    this.tagihan,
    this.beaAdmin,
    this.totTagihan,
    this.totalPremi,
    this.bpjsBalance,
    this.reff
  });

  BPJSInquiryResponse.fromJson(Map<String, dynamic> json) {
    noVa = json['no_va'];
    nama = json['nama'];
    kdCabang = json['kd_cabang'];
    jmlPst = json['jml_pst'];
    periode = json['periode'];
    tagihan = json['tagihan'];
    beaAdmin = json['bea_admin'];
    totTagihan = json['tot_tagihan'];
    totalPremi = json['total_premi'];
    bpjsBalance = json['bpjs_balance'];
    reff = json['reff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no_va'] = this.noVa;
    data['nama'] = this.nama;
    data['kd_cabang'] = this.kdCabang;
    data['jml_pst'] = this.jmlPst;
    data['periode'] = this.periode;
    data['tagihan'] = this.tagihan;
    data['bea_admin'] = this.beaAdmin;
    data['tot_tagihan'] = this.totTagihan;
    data['total_premi'] = this.totalPremi;
    data['bpjs_balance'] = this.bpjsBalance;
    data['reff'] = this.reff;
    return data;
  }
}
