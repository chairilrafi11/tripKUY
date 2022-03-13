class TelephoneInquiryResponse {
  String? idPelanggan;
  String? namaPelanggan;
  String? bulan;
  String? periode;
  String? daya;
  int? totalBill;
  int? admin;
  int? total;
  String? refnum;
  dynamic transactionId;

  TelephoneInquiryResponse({
    this.idPelanggan,
    this.namaPelanggan,
    this.bulan,
    this.periode,
    this.daya,
    this.totalBill,
    this.admin,
    this.total,
    this.refnum,
    this.transactionId
  });

  TelephoneInquiryResponse.fromJson(Map<String, dynamic> json) {
    idPelanggan = json['id_pelanggan'];
    namaPelanggan = json['nama_pelanggan'];
    bulan = json['bulan'];
    periode = json['periode'];
    daya = json['daya'];
    totalBill = json['total_bill'];
    admin = json['admin'];
    total = json['total'];
    refnum = json['refnum'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_pelanggan'] = idPelanggan;
    data['nama_pelanggan'] = namaPelanggan;
    data['bulan'] = bulan;
    data['periode'] = periode;
    data['daya'] = daya;
    data['total_bill'] = totalBill;
    data['admin'] = admin;
    data['total'] = total;
    data['refnum'] = refnum;
    data['transaction_id'] = transactionId;
    return data;
  }
}
