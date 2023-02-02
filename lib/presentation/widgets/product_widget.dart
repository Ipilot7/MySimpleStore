import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    this.textColor,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    this.containerColor,
  });
  final Color? textColor;
  final Color? containerColor;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: containerColor ?? Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 73.w,
            child: Text(
              text1,
              style: TextStyle(color: Color == null ? Colors.black : textColor),
            ),
          ),
          SizedBox(
            width: 70.w,
            child: Text(
              text2,
              style: TextStyle(color: Color == null ? Colors.black : textColor),
            ),
          ),
          SizedBox(
            width: 50.w,
            child: Text(
              text3,
              style: TextStyle(color: Color == null ? Colors.black : textColor),
            ),
          ),
          SizedBox(
            width: 36.w,
            child: Text(
              text4,
              style: TextStyle(color: Color == null ? Colors.black : textColor),
            ),
          ),
        ],
      ),
    );
  }
}
