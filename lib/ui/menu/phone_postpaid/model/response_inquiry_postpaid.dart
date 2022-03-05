class ResponseInquiryPhonePaid {
  String? idPelanggan;
  String? nama;
  String? bulan;
  dynamic tagihan;
  dynamic admin;
  int? total;
  String? transactionCode;
  String? noResi;
  int? transactionId;

  ResponseInquiryPhonePaid(
      {this.idPelanggan,
        this.nama,
        this.bulan,
        this.tagihan,
        this.admin,
        this.total,
        this.transactionCode,
        this.noResi,
        this.transactionId});

  ResponseInquiryPhonePaid.fromJson(Map<String, dynamic> json) {
    idPelanggan = json['id_pelanggan'];
    nama = json['nama'];
    bulan = json['bulan'];
    tagihan = json['tagihan'];
    admin = json['admin'];
    total = json['total'];
    transactionCode = json['transaction_code'];
    noResi = json['no_resi'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_pelanggan'] = idPelanggan;
    data['nama'] = nama;
    data['bulan'] = bulan;
    data['tagihan'] = tagihan;
    data['admin'] = admin;
    data['total'] = total;
    data['transaction_code'] = transactionCode;
    data['no_resi'] = noResi;
    data['transaction_id'] = transactionId;
    return data;
  }
}
