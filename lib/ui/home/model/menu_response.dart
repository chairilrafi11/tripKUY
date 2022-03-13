class MenuResponse {
  int? id;
  String? title;
  String? urlImage;

  MenuResponse({this.id, this.title, this.urlImage});

  MenuResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    urlImage = json['url_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url_image'] = urlImage;
    return data;
  }
}
