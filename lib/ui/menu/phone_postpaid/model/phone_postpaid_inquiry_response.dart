class PhonePostpaidInquiryResponse {
  String? idPelanggan;
  String? nama;
  String? bulan;
  String? bulanTagihan;
  String? daya;
  dynamic tagihan;
  dynamic admin;
  dynamic total;
  String? noResi;
  String? transactionCode;
  dynamic transactionId;

  PhonePostpaidInquiryResponse({
    this.idPelanggan,
    this.nama,
    this.bulan,
    this.bulanTagihan,
    this.daya,
    this.tagihan,
    this.admin,
    this.total,
    this.noResi,
    this.transactionCode,
    this.transactionId
  });

  PhonePostpaidInquiryResponse.fromJson(Map<String, dynamic> json) {
    idPelanggan = json['id_pelanggan'];
    nama = json['nama'];
    bulan = json['bulan'];
    bulanTagihan = json['bulan_tagihan'];
    daya = json['daya'];
    tagihan = json['tagihan'];
    admin = json['admin'];
    total = json['total'];
    noResi = json['no_resi'];
    transactionCode = json['transaction_code'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_pelanggan'] = idPelanggan;
    data['nama'] = nama;
    data['bulan'] = bulan;
    data['bulan_tagihan'] = bulanTagihan;
    data['daya'] = daya;
    data['tagihan'] = tagihan;
    data['admin'] = admin;
    data['total'] = total;
    data['no_resi'] = noResi;
    data['transaction_code'] = transactionCode;
    data['transaction_id'] = transactionId;
    return data;
  }
}
