import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.width,
    this.margin,
    this.borderRadius,
    required this.controller,
  });
  final TextEditingController controller;
  final String hintText;
  final Widget? icon;
  final double? width;
  final double? margin;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w,
      margin: EdgeInsets.symmetric(horizontal: margin == null ? 5.w : margin!),
      height: 40.h,
      child: TextField(
        controller: controller,
        style: AppTextStyles.body16w4,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.h,
              color: const Color(0xff2F80ED),
            ),
            borderRadius: BorderRadius.circular(
                borderRadius == null ? 32.r : borderRadius!),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                borderRadius == null ? 32.r : borderRadius!),
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.body16w4,
          contentPadding: EdgeInsets.only(left: 10.w),
          fillColor: const Color(0xff2F80ED),
          suffixIcon: Padding(
              padding: EdgeInsets.only(right: 5.w, top: 5.h, bottom: 5.h),
              child: icon),
        ),
      ),
    );
  }
}
