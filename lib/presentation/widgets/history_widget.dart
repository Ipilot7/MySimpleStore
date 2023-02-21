
import 'package:flutter/material.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/presentation/widgets/sold_products.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    Key? key,
    required this.dataList,
  }) : super(key: key);
  final List<IncomeExpensesModel> dataList;

  @override
  Widget build(BuildContext context) {
    double sum = 0;

    // for (int i = 0; i < dataList.length; i++) {
    //   sum += dataList[i].price!;
    // }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataList.first.datatime!,
                style: AppTextStyles.body20wB,
              ),
              Text(
                '+$sum UZS',
                style: AppTextStyles.body18w4
                    .copyWith(color: AppColors.lastAction),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            children: List.generate(
              dataList.length,
              (index) => SoldProducts(
                desc: dataList[index].desc??'',
                isIncoming: dataList[index].isincome == 1,
                price: (dataList[index].price??0).toString(),
                // time: dataList[index].datatime!,
                type: dataList[index].type??'55',
              ),
            ),
          ),
        ),
      ],
    );
  }

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }
}
