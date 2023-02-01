import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 40.h,
      child: TextField(
        style: AppTextStyles.body16w4,
        decoration: InputDecoration(
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
          hintText: 'Введите артикул',
          hintStyle: AppTextStyles.body16w4,
          contentPadding: EdgeInsets.only(left: 30.w),
          fillColor: const Color(0xff2F80ED),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 30.w, top: 5.h, bottom: 5.h),
            child: InkWell(
                borderRadius: BorderRadius.circular(10.r),
                child: const Icon(Icons.search)),
          ),
        ),
      ),
    );
  }
}
