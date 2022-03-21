class Meta {
  int? code;
  dynamic messages;
  Pagination? pagination;

  Meta({this.code, this.messages, this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    if(json['error_code'] != null){
      code = json['error_code'];
    } else {
      code = json['code'];
    }
    messages = json['messages'];
    if (json['pagination'] != null) {
      pagination = Pagination.fromJson(json['pagination']);
    } else {
      pagination = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['messages'] = messages;
    if (pagination != null) {
      data['pagination'] = pagination?.toJson();
    }
    return data;
  }
}

class Pagination {
  int? total;
  int? perPage;
  int? totalPage;
  int? currentPage;
  int? nextPage;
  int? prevPage;
  bool? isFirstPage;
  bool? isLastPage;
  bool? isOutOfRange;

  Pagination({
    this.total,
    this.perPage,
    this.totalPage,
    this.currentPage,
    this.nextPage,
    this.prevPage,
    this.isFirstPage,
    this.isLastPage,
    this.isOutOfRange
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
    isFirstPage = json['is_first_page'];
    isLastPage = json['is_last_page'];
    isOutOfRange = json['is_out_of_range'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['per_page'] = perPage;
    data['total_page'] = totalPage;
    data['current_page'] = currentPage;
    data['next_page'] = nextPage;
    data['prev_page'] = prevPage;
    data['is_first_page'] = isFirstPage;
    data['is_last_page'] = isLastPage;
    data['is_out_of_range'] = isOutOfRange;
    return data;
  }
}
