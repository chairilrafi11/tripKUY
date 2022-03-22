class ResponseNotification {
  String? dataTitle;
  String? dataBody;
  String? dataImage;
  String? clickAction;
  String? notificationType;
  String? statucCode;
  String? statusName;

  ResponseNotification(
      {this.dataTitle,
      this.dataBody,
      this.dataImage,
      this.clickAction,
      this.notificationType,
      this.statucCode,
      this.statusName});

  ResponseNotification.fromJson(Map<String, dynamic> json) {
    dataTitle = json['data_title'];
    dataBody = json['data_body'];
    dataImage = json['data_image'];
    clickAction = json['click_action'];
    notificationType = json['notification_type'];
    statucCode = json['statuc_code'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data_title'] = dataTitle;
    data['data_body'] = dataBody;
    data['data_image'] = dataImage;
    data['click_action'] = clickAction;
    data['notification_type'] = notificationType;
    data['statuc_code'] = statucCode;
    data['status_name'] = statusName;
    return data;
  }
}
