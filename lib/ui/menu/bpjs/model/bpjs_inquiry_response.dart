class BPJSInquiryResponse {
  dynamic noVa;
  String? nama;
  String? kdCabang;
  String? namaCabang;
  dynamic jmlPst;
  dynamic periode;
  dynamic tagihan;
  int? beaAdmin;
  dynamic totTagihan;
  dynamic totalPremi;
  dynamic bpjsBalance;
  dynamic reff;
  int? transactionId;

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
    this.reff,
    this.transactionId
  });

  BPJSInquiryResponse.fromJson(Map<String, dynamic> json) {
    noVa = json['no_va'];
    nama = json['nama'];
    kdCabang = json['kd_cabang'];
    namaCabang = json['nama_cabang'];
    jmlPst = json['jml_pst'];
    periode = json['periode'];
    tagihan = json['tagihan'];
    beaAdmin = json['bea_admin'];
    totTagihan = json['tot_tagihan'];
    totalPremi = json['total_premi'];
    bpjsBalance = json['bpjs_balance'];
    reff = json['reff'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_va'] = noVa;
    data['nama'] = nama;
    data['kd_cabang'] = kdCabang;
    data['nama_cabang'] = kdCabang;
    data['jml_pst'] = jmlPst;
    data['periode'] = periode;
    data['tagihan'] = tagihan;
    data['bea_admin'] = beaAdmin;
    data['tot_tagihan'] = totTagihan;
    data['total_premi'] = totalPremi;
    data['bpjs_balance'] = bpjsBalance;
    data['reff'] = reff;
    data['transaction_id'] = transactionId;
    return data;
  }
}
