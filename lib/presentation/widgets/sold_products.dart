import 'package:flutter/material.dart';

class SoldProducts extends StatelessWidget {
  const SoldProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Product Name'),
              Text('Article'),
              Text('Price'),
              Text('14:30')
            ],
          )
        ],
      ),
    );
  }
}
