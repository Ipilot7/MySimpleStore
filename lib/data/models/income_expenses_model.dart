class IncomeExpensesModel {
  String? type;
  String? desc;
  DateTime? dataTime;
  bool? isincome;
  double? price;

  IncomeExpensesModel(
      {this.type, this.desc, this.dataTime, this.isincome, this.price});

  IncomeExpensesModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    desc = json['desc'];
    dataTime = json['dataTime'];
    isincome = json['isincome'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['desc'] = desc;
    data['dataTime'] = dataTime;
    data['isincome'] = isincome;
    data['price'] = price;
    return data;
  }
}
