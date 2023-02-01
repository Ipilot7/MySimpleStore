
import 'package:flutter/material.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
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
              const Text('+12 500 UZS')
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
              children: const [SoldProducts(), SoldProducts(), SoldProducts()]),
        )
      ],
    );
  }
}
