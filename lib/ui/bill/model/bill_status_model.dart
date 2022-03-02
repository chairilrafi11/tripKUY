import 'bill_body_model.dart';

class BillStatusModel {
  List<BillBodyModel> billBody;
  String? createdAt;
  String status;

  BillStatusModel({
    required this.billBody, 
    this.createdAt, 
    required this.status
  });
}