class PDAMInquiryResponse {
  dynamic noPel;
  String? nama;
  dynamic periode;
  dynamic stand;
  dynamic beaAdmin;
  dynamic totTagihan;
  String? referalNumber;
  dynamic tagihan;
  dynamic transactionId;

  PDAMInquiryResponse({
    this.noPel,
    this.nama,
    this.periode,
    this.stand,
    this.beaAdmin,
    this.totTagihan,
    this.referalNumber,
    this.tagihan,
    this.transactionId
  });

  PDAMInquiryResponse.fromJson(Map<String, dynamic> json) {
    noPel = json['no_pel'];
    nama = json['nama'];
    periode = json['periode'];
    stand = json['stand'];
    beaAdmin = json['bea_admin'];
    totTagihan = json['tot_tagihan'];
    referalNumber = json['referal_number'];
    tagihan = json['tagihan'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_pel'] = noPel;
    data['nama'] = nama;
    data['periode'] = periode;
    data['stand'] = stand;
    data['bea_admin'] = beaAdmin;
    data['tot_tagihan'] = totTagihan;
    data['referal_number'] = referalNumber;
    data['tagihan'] = tagihan;
    data['transaction_id'] = transactionId;
    return data;
  }
}
