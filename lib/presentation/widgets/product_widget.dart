import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(width: 73, child: Text('Брюкиы')),
          SizedBox(width: 57, child: Text('AQ-5432')),
          SizedBox(width: 52, child: Text('xs')),
          SizedBox(width: 36, child: Text('10')),
          SizedBox(width: 36, child: Text('12 000')),
        ],
      ),
    );
  }
}
