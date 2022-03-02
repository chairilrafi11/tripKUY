import 'meta.dart';

class CoreModel {
  Meta meta = Meta(code: 530, messages: "default error");
  dynamic data;

  CoreModel({required this.meta, this.data});

  CoreModel.fromJson(Map<String, dynamic> json) {
    meta = (json['meta'] != null ? Meta.fromJson(json['meta']) : Meta());
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (this.meta != null) {
      data['meta'] = meta.toJson();
    // }
    data['data'] = data;
    return data;
  }
}
