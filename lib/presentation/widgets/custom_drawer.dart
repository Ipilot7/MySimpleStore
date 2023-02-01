import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/assets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h),
        CircleAvatar(
          radius: 50,
          child: Image.asset(Assets.images.defAvatar),
        ),
        SizedBox(height: 10.h),
        Text(
          'User ID',
          style: AppTextStyles.body20w5,
        ),
      ],
    );
  }
}
