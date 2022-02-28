class ResponseCommunity {
  int? id;
  String? code;
  String? name;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kelurahan;
  int? regencyId;

  ResponseCommunity(
      {this.id,
        this.code,
        this.name,
        this.provinsi,
        this.kota,
        this.kecamatan,
        this.kelurahan,
        this.regencyId});

  ResponseCommunity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    provinsi = json['provinsi'];
    kota = json['kota'];
    kecamatan = json['kecamatan'];
    kelurahan = json['kelurahan'];
    regencyId = json['regency_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['provinsi'] = provinsi;
    data['kota'] = kota;
    data['kecamatan'] = kecamatan;
    data['kelurahan'] = kelurahan;
    data['regency_id'] = regencyId;
    return data;
  }
}