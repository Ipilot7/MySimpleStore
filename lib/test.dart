import 'package:my_simple_store/data/models/income_expenses_model.dart';

void main(List<String> args) {
  List<IncomeExpensesModel> data = [];
  List filteredList = [];
  for (int i = 0; i < 12; i++) {
    if (i == 1) {
      data.add(IncomeExpensesModel(
        id: i,
        price: i + 54323,
        desc: 'date00',
      ));
    } else {
      data.add(
        IncomeExpensesModel(
          id: i,
          price: i + 54323,
          desc: 'date0$i',
        ),
      );
    }
  }

  for (int i = 0; i < data.length; i++) {
    var a = data[i].desc;
    List<IncomeExpensesModel> set = [];
    for (int j = 0; j < data.length; j++) {
      if (a == data[j].desc) {
        set.add(data[i]);
      }
    }
    filteredList.add(set);
  }

  getData(filteredList);
}

getData(List a) {
  for (int i = 0; i < a.length; i++) {
    List<IncomeExpensesModel> first = a[i];
    for (int j = 0; j < first.length; j++) {
      print(first[j].desc);
    }
    print('>------------------<');
  }
}
