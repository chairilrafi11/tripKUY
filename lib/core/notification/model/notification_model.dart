class NotificationModel {
  String? notificationType;
  String? statusCode;
  String? dataBody;
  String? dataIcon;
  String? clickAction;
  List<int>? menuOrderIds;
  int? orderId;
  String? dataTitle;

  NotificationModel({
    this.notificationType,
    this.statusCode,
    this.dataBody,
    this.dataIcon,
    this.clickAction,
    this.menuOrderIds,
    this.orderId,
    this.dataTitle
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationType = json['notification_type'];
    statusCode = json['status_code'];
    dataBody = json['data_body'];
    dataIcon = json['data_icon'];
    clickAction = json['click_action'];
    menuOrderIds = json['menu_order_ids'].cast<int>();
    orderId = json['order_id'];
    dataTitle = json['data_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_type'] = notificationType;
    data['status_code'] = statusCode;
    data['data_body'] = dataBody;
    data['data_icon'] = dataIcon;
    data['click_action'] = clickAction;
    data['menu_order_ids'] = menuOrderIds;
    data['order_id'] = orderId;
    data['data_title'] = dataTitle;
    return data;
  }
}
