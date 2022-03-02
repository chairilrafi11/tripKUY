class BillModel {

  List<Set<String>> users;
  List<Set<String>> cost;
  String totalPayment;

  BillModel({
    required this.users, 
    required this.cost, 
    required this.totalPayment
  });
}
