import 'package:flutter/material.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.withOpacity(0.1),
      child: Column(
        children: [
          const TextField(),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: AppColors.products),
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
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 73, child: Text('Категории')),
                SizedBox(width: 57, child: Text('Артикул')),
                SizedBox(width: 52, child: Text('Раpмер')),
                SizedBox(width: 36, child: Text('Штук')),
                SizedBox(width: 36, child: Text('Цена')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
