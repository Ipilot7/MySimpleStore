import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeAndCountWidget extends StatelessWidget {
  const SizeAndCountWidget({
    Key? key,
    required this.size,
    required this.count,
    this.color, required this.ontap,
    
  }) : super(key: key);
  final String size;
  final String count;
  final Color? color;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 55.w, child: Text(size)),
        GestureDetector(
          onTap: ()=>ontap() ,
          child: Container(
            width: 100.w,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color ?? Colors.white),
            child: Text(count),
          ),
        ),
      ],
    );
  }
}
