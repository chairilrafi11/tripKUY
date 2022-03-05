class TelephonePaymentResponse {
  String? idPelanggan;
  String? namaPelanggan;
  String? bulan;
  String? periode;
  String? daya;
  int? totalBill;
  int? admin;
  int? total;
  String? refnum;

  TelephonePaymentResponse({
    this.idPelanggan,
    this.namaPelanggan,
    this.bulan,
    this.periode,
    this.daya,
    this.totalBill,
    this.admin,
    this.total,
    this.refnum
  });

  TelephonePaymentResponse.fromJson(Map<String, dynamic> json) {
    idPelanggan = json['id_pelanggan'];
    namaPelanggan = json['nama_pelanggan'];
    bulan = json['bulan'];
    periode = json['periode'];
    daya = json['daya'];
    totalBill = json['total_bill'];
    admin = json['admin'];
    total = json['total'];
    refnum = json['refnum'];
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
    return data;
  }
}
