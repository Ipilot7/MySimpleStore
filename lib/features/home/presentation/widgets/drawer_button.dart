
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';

class DraverButton extends StatelessWidget {
  const DraverButton({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 5.w),
          Text(
            text,
            style: AppTextStyles.body18w5.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
