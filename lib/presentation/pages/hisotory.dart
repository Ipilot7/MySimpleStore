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
                '350000000000',
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
                  child: Text('No Task Found'),
                );
              } else {
                List filterList = [];
                List<IncomeExpensesModel> newData = [...snapshot.data!];
                for (int i = 0; i < newData.length; i++) {
                  var a = newData[i].datatime;
                  List<IncomeExpensesModel> set = [];
                  for (int j = 0; j < newData.length; j++) {
                    if (newData[j].datatime == a) {
                      set.add(newData[j]);
                    }
                  }
                  filterList.add(set);
                }
                print(filterList.length);
                return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    controller: widget.controller,
                    children: List.generate(
                      filterList.length,
                      (index) => HistoryWidget(
                        dataList: filterList[index],
                      ),
                    ));
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
