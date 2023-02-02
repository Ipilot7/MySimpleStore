import 'package:flutter/material.dart';

class ProductsTitlesWidget extends StatelessWidget {
  const ProductsTitlesWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    this.textColor,
  });
  final Color? textColor;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1,
              style:
                  TextStyle(color: Color == null ? Colors.black : textColor)),
          Text(text2,
              style:
                  TextStyle(color: Color == null ? Colors.black : textColor)),
          // Text('Размер'),
          Text(text3,
              style:
                  TextStyle(color: Color == null ? Colors.black : textColor)),
          Text(text4,
              style:
                  TextStyle(color: Color == null ? Colors.black : textColor)),
        ],
      ),
    );
  }
}
