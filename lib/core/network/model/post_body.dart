class PostBody{

  late String key;

  PostBody(this.key);

  PostBody.fromJson(Map<String, dynamic> json) {
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    return data;
  }
}

class BodyRequestV7 {
  String? key;
  String? payload;

  BodyRequestV7(this.key, this.payload);

  BodyRequestV7.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['payload'] = payload;
    return data;
  }
}