import 'package:flutter/material.dart';

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
