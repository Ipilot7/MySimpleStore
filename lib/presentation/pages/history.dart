import 'package:flutter/material.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/data/services/incomeService.dart';
import 'package:my_simple_store/presentation/widgets/history_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<List<IncomeExpensesModel>> filterList = [];
  late List<IncomeExpensesModel> _dataList = <IncomeExpensesModel>[];
  final _userService = IncomeService();

  getAllUserDetails() async {
    List users = await _userService.readAllData();
    _dataList = <IncomeExpensesModel>[];
    users.forEach((user) {
      setState(() {
        var userModel = IncomeExpensesModel();
        userModel.id = user['id'];
        userModel.desc = user['desc'];
        userModel.price = user['price'];
        userModel.datatime = user['datatime'];
        userModel.isincome = user['isincome'];

        _dataList.add(userModel);
      });
    });

    List<IncomeExpensesModel> newData = [..._dataList];
    for (int i = 0; i < newData.length; i++) {
      var a = newData[i].datatime;
      List<IncomeExpensesModel> set = [];
      for (int j = 0; j < newData.length; j++) {
        if (a == _dataList[j].datatime) {
          set.add(newData[j]);
          newData[j] = IncomeExpensesModel(datatime: '');
        }
      }
      if (set.isNotEmpty) {
        filterList.add(set);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("История"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: filterList.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return HistoryWidget(sortedDataList: filterList[index]);
          }),
    );
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }
}
