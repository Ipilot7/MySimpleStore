import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/data/data_providers/db_handler.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/presentation/widgets/history_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage(
      {super.key, required this.controller, required this.panelController});
  final ScrollController controller;
  final PanelController panelController;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DBHelper? dbHelper;
  late Future<List<IncomeExpensesModel>> dataList;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    dataList = dbHelper!.getDataList();
  }

  double allDebit = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: tooglePanel,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.w),
              width: size.width * 0.5,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$allDebit',
                style: AppTextStyles.body22w5.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: dataList,
            builder:
                (context, AsyncSnapshot<List<IncomeExpensesModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Данных нет'),
                );
              } else {
                List<List<IncomeExpensesModel>> filterList = [];
                List<IncomeExpensesModel> newData = [...snapshot.data!];
                for (int i = 0; i < snapshot.data!.length; i++) {
                  var a = snapshot.data![i].datatime;
                  List<IncomeExpensesModel> set = [];
                  for (int j = 0; j < newData.length; j++) {
                    if (a == newData[j].datatime) {
                      set.add(newData[j]);
                      newData[j] = IncomeExpensesModel(datatime: '');
                    }
                  }
                  if (set.isNotEmpty) {
                    filterList.add(set);
                  }
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  controller: widget.controller,
                  itemCount: filterList.length,
                  itemBuilder: (_, index) =>
                      HistoryWidget(dataList: filterList[index]),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  void tooglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();
}
