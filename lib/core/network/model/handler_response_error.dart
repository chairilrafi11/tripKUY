class HandlerResponseError {
  List<String>? messages = <String>[];

  HandlerResponseError({this.messages});

  HandlerResponseError.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      try {
        for(dynamic element in json['messages']){
          messages?.add(element.toString());
        }
      } catch (e) {
        messages!.add(json['messages']);
      }
    } else if (json['message'] != null) {
      for(dynamic element in json['message']){
        messages?.add(element.toString());
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messages'] = messages;
    return data;
  }
}
