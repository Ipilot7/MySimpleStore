
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';

class TextFieldAddCategory extends StatelessWidget {
  const TextFieldAddCategory({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);
  final TextEditingController controller;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: 40.h,
      child: TextField(
        controller: controller,
        style: AppTextStyles.body16w4,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10, top: 5, right: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.h,
              color: const Color(0xff2F80ED),
            ),
            borderRadius: BorderRadius.circular(32.r),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          hintText: text,
          hintStyle: AppTextStyles.body16w4.copyWith(color: Colors.grey),
          fillColor: const Color(0xff2F80ED),
        ),
      ),
    );
  }
}
