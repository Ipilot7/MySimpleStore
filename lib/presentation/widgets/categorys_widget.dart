import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';

class MyCategorysWidget extends StatelessWidget {
  const MyCategorysWidget({
    Key? key,
    required this.category,
    required this.size,
    this.color,
  }) : super(key: key);
  final String category;
  final String size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 100.w,
                child: Text(
                  category,
                  style: AppTextStyles.body20w5
                      .copyWith(color: color ?? Colors.white),
                )),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 100.w,
                child: Text(size,
                    style: AppTextStyles.body20w5
                        .copyWith(color: color ?? Colors.white))),
          ],
        ),
      ],
    );
  }
}
