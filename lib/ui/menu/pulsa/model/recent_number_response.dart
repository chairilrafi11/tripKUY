class RecentNumberResponse {
  String? numbers;
  String? date;

  RecentNumberResponse({this.numbers, this.date});

  RecentNumberResponse.fromJson(Map<String, dynamic> json) {
    numbers = json['numbers'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numbers'] = numbers;
    data['date'] = date;
    return data;
  }
}
