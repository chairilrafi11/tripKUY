class BannerResponse {
  int? id;
  String? bannerName;
  int? priority;
  String? createdAt;
  String? linkUrl;
  String? description;
  String? imageUrl;

  BannerResponse({
    this.id,
    this.bannerName,
    this.priority,
    this.createdAt,
    this.linkUrl,
    this.description,
    this.imageUrl
  });

  BannerResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerName = json['banner_name'];
    priority = json['priority'];
    createdAt = json['created_at'];
    linkUrl = json['link_url'];
    description = json['description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banner_name'] = bannerName;
    data['priority'] = priority;
    data['created_at'] = createdAt;
    data['link_url'] = linkUrl;
    data['description'] = description;
    data['image_url'] = imageUrl;
    return data;
  }
}
