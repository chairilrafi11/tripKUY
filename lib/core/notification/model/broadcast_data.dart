class BroadCastData {
  String? statusCode;
  String? notificationType;
  String? orderId;
  String? statusName;
  String? orderType;
  bool? isClickChat;

  BroadCastData({
    this.statusCode,
    this.notificationType,
    this.orderId,
    this.statusName,
    this.orderType,
    this.isClickChat
  });

  BroadCastData.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    notificationType = json['notification_type'];
    orderId = json['order_id'];
    statusName = json['status_name'];
    orderType = json['order_type'];
    isClickChat = json['is_click_chat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['notification_type'] = notificationType;
    data['order_id'] = orderId;
    data['status_name'] = statusName;
    data['order_type'] = orderType;
    data['is_click_chat'] = isClickChat;
    return data;
  }
}
