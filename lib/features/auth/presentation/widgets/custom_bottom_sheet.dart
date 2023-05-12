import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/constants/all_constants.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key, required this.email, required this.sendFunc});
  final String email;
  final Function() sendFunc;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  bool isNext = false, isLoading = false, isError = false;

  final defaultPinTheme = PinTheme(
    width: 77.w,
    height: 89.h,
    textStyle: AppTextStyles.body37w5.copyWith(color: AppColors.white),
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColors.unActText,
      ),
      borderRadius: BorderRadius.circular(18.r),
    ),
  );

  late final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    borderRadius: BorderRadius.circular(18.r),
    border: Border.all(
      color: isError == true ? AppColors.green : AppColors.blue,
    ),
    color: AppColors.blue,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26.r), topRight: Radius.circular(26.r))),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
            child: Center(
              child: Divider(
                indent: 151.w,
                endIndent: 151.w,
                thickness: 4.h,
                height: 4.h,
                color: AppColors.unActText,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Verify phone',
                style: AppTextStyles.body20w7.copyWith(
                  color: AppColors.textfield,
                ),
              ),
              Text(
                'Close',
                style: AppTextStyles.body18w4.copyWith(color: AppColors.blue),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 24.h, bottom: 9.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Phone number',
                  style: AppTextStyles.body14w4
                      .copyWith(color: AppColors.unActText)),
            ),
          ),
          CustomTextField(
            hintText: 'Phone',
            controller: TextEditingController()..text = widget.email,
            isPassword: false,
            readOnly: true,
          ),
          Padding(
            padding: EdgeInsets.only(top: 14, bottom: 34.h),
            child: Text(
              'We will send you a verification code to a new email',
              style:
                  AppTextStyles.body18w4.copyWith(color: AppColors.unActText),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: focusedPinTheme,
              length: 6,
              validator: (s) {
                setState(() {
                  isNext = true;
                });
                // _sendSMS(s.toString());
                return null;
              },
              // focusNode: _pinPutFocusNode,
              // controller: _pinPutController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 67.h, bottom: 68.h),
            child: CustomButton(
              onPressed: widget.sendFunc,
              color: AppColors.white,
              text: 'Send',
              borderColor: AppColors.blue,
            ),
          )
        ],
      ),
    );
  }
}
