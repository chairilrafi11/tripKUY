class Secrect {
  String? secrect;

  Secrect({this.secrect});

  Secrect.fromJson(Map<String, dynamic> json) {
    secrect = json['secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['secret'] = secrect;
    return data;
  }
}
