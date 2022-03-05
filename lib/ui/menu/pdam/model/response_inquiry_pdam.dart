class ResponseInquiryPDAM {
  String? noPel;
  String? nama;
  String? periode;
  dynamic stand;
  dynamic beaAdmin;
  int? totTagihan;
  String? referalNumber;
  dynamic tagihan;
  int? transactionId;

  // atozagen
  // this.action = action;
  // this.id = id;
  // this.product = product;
  // this.productId = productId;
  // this.payment = payment;
  // this.balance = balance;
  // this.transactionId = transactionId;

  ResponseInquiryPDAM(
      {this.noPel,
        this.nama,
        this.periode,
        this.stand,
        this.beaAdmin,
        this.totTagihan,
        this.referalNumber,
        this.tagihan});

  ResponseInquiryPDAM.fromJson(Map<String, dynamic> json) {
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
