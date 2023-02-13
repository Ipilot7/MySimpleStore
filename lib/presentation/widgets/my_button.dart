import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final buttonText;
  final buttontapped;

  const MyButton(
      {super.key,
      this.color,
      this.textColor,
      this.buttonText,
      this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(22.r)),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
