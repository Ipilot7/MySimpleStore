import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants/all_constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    required this.controller,
    required this.isPassword,
    // this.isOTP,
    this.autofocus,
    this.onSubmitted,
    this.inputFormatters,
    this.focusNode, this.title,
  });

  final String? hintText;
  final String? title;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final bool isPassword;
  // final bool? isOTP;
  final bool? autofocus;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title!=null? Padding(
          padding: EdgeInsets.only(left: 20.w, top: 24.h, bottom: 9.h),
          child: Text(
            widget.title??'',
            style: AppTextStyles.body14w4.copyWith(color: AppColors.unActText),
          ),
        ):const SizedBox.shrink(),
        TextFormField(
          autofocus: widget.autofocus ?? false,
          validator: (value) => EmailValidator.validate(value ?? '')
              ? null
              : 'Please enter a valid email',
          style: AppTextStyles.body18w4.copyWith(color: AppColors.textfield),
          controller: widget.controller,
          focusNode: widget.focusNode,
          cursorColor: AppColors.unActText,
          obscureText: widget.isPassword ? isHide : false,
          obscuringCharacter: '*',
          onFieldSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () => setState(() => isHide = !isHide),
                    child: isHide
                        ? Icon(Icons.visibility_off_outlined,
                            color: AppColors.white)
                        : Icon(Icons.visibility_outlined,
                            color: AppColors.white),
                  )
                : const SizedBox(),
            prefixIconConstraints:
                BoxConstraints(maxHeight: 40.h, maxWidth: 40.w),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: widget.prefixIcon,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(20.r),
            //   borderSide: const BorderSide(width: 1, color: AppColors.unActText),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(20.r),
            //   borderSide: const BorderSide(width: 1, color: AppColors.unActText),
            // ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
            filled: true,
            fillColor: AppColors.bgTextfield,
            hintStyle:
                AppTextStyles.body18w4.copyWith(color: AppColors.unActText),
            hintText: widget.hintText ?? "text",
            // fillColor: AppTheme.gray6
          ),
          // keyboardType:
          //     widget.isOTP != null ? TextInputType.phone : TextInputType.multiline,
          inputFormatters: widget.inputFormatters ?? [],
        ),
      ],
    );
  }
}
