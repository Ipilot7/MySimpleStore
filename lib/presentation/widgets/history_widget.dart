import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/presentation/routes/routes.dart';
import 'package:my_simple_store/presentation/widgets/sold_products.dart';

import '../../data/services/incomeService.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    double sum = 1;
    double rasxod = 0;
    double doxod = 0;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '5fsdf',
                style: AppTextStyles.body20wB,
              ),
              sum > 0
                  ? Text(
                      '+$sum UZS',
                      style: AppTextStyles.body18w4
                          .copyWith(color: AppColors.lastAction),
                    )
                  : Text(
                      '$sum UZS',
                      style: AppTextStyles.body18w4
                          .copyWith(color: AppColors.lastAction),
                    )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            children: List.generate(
              10,
              (index) => Slidable(
                key: const ValueKey(5),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      flex: 2,
                      onPressed: (BuildContext context) {},
                      backgroundColor: const Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Изменить',
                    ),
                    SlidableAction(
                      onPressed: (BuildContext context) {
                        setState(() {});
                      },
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Удалить',
                    ),
                  ],
                ),
                child: const SoldProducts(
                  desc: '',
                  isIncoming: true,
                  price: '10',
                  type: '',
                ),
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

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
