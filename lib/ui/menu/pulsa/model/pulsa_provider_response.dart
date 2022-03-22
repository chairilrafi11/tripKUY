class PulsaProviderResponse {
  Provider? pulsa;
  Provider? paket;

  PulsaProviderResponse({this.pulsa, this.paket});

  PulsaProviderResponse.fromJson(Map<String, dynamic> json) {
    pulsa = json['pulsa'] != null ? Provider.fromJson(json['pulsa']) : null;
    paket = json['paket'] != null ? Provider.fromJson(json['paket']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pulsa != null) {
      data['pulsa'] = pulsa!.toJson();
    }
    if (paket != null) {
      data['paket'] = paket!.toJson();
    }
    return data;
  }
}

class Provider {
  String? iconPath;

  Provider({this.iconPath});

  Provider.fromJson(Map<String, dynamic> json) {
    iconPath = json['icon_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon_path'] = iconPath;
    return data;
  }
}
