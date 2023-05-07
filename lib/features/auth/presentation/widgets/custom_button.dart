import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants/all_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.color,
    this.borderColor,
    required this.text,
  });
  final Function onPressed;
  final Color? color;
  final Color? borderColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => onPressed(),
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              side: MaterialStatePropertyAll(
                  BorderSide(color: borderColor ?? Colors.transparent)),
              backgroundColor:
                  MaterialStatePropertyAll(color ?? AppColors.blue),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r))),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 22.h)),
              // textStyle: MaterialStateProperty.all(AppTextStyles.body20w4
              //     .copyWith(
              //         color: color == AppColors.blue
              //             ? AppColors.white
              //             : AppColors.blue))
            ),
            child: Text(
              text,
              style: AppTextStyles.body20w4.copyWith(
                  color: color == null ? AppColors.white : AppColors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
