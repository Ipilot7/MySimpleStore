import 'package:flutter/material.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/local_data.dart';
import 'package:my_simple_store/presentation/widgets/sold_products.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '28 Январь',
                style: AppTextStyles.body20wB,
              ),
              Text(
                '+12 500 UZS',
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
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: hello.length,
            itemBuilder: (_, index) {
              print(hello[index].dataTime);

              return SoldProducts(
                desc: hello[index].desc!,
                isIncoming: hello[index].isincome!,
                price: hello[index].price!.toString(),
                time: hello[index].dataTime!.toString(),
                type: hello[index].type!,
              );
            },
          ),
        ),
      ],
    );
  }
}
