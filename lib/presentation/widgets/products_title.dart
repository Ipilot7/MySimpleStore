import 'package:flutter/material.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';

class ProductsTitlesWidget extends StatelessWidget {
  const ProductsTitlesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          // gradient: AppColors.products
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Категории'),
          Text('Артикул'),
          Text('Размер'),
          Text('Штук'),
          Text('Цена'),
        ],
      ),
    );
  }
}
