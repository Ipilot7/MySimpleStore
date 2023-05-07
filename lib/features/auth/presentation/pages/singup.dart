// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pinput/pinput.dart';

// import '../../../../config/constants/all_constants.dart';
// import '../widgets/custom_button.dart';
// import '../widgets/custom_textfield.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController _pinPutController = TextEditingController();
//   final FocusNode _pinPutFocusNode = FocusNode();
//   bool isNext = false, isLoading = false, isError = false;

//   TextEditingController phone = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 24.w),
//         child: Column(
//           children: [
            
//             Padding(
//               padding: EdgeInsets.only(left: 20.w, top: 88.h, bottom: 9.h),
//               child: Text('Sign up',
//                   style: AppTextStyles.head34w9.copyWith(color: AppColors.blue)),
//             ),
            
//             CustomTextField(
//               hintText: 'Phone',
//               controller: phone,
//               title: 'Phone number*',
//               isPassword: false,
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 14, bottom: 64.h),
//               child: Text(
//                   'We will send you a verification code to a new number',
//                   style: AppTextStyles.body18w4
//                       .copyWith(color: AppColors.unActText)),
//             ),
//             CustomButton(
//               onPressed: () {
//                 bottomSheets(context);
//               },
//               text: 'Continue',
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: 40.h, top: 16.h),
//               child: Text('Our Terms of Service and Privacy Policy apply',
//                   style: AppTextStyles.body14w4
//                       .copyWith(color: AppColors.unActText)),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SvgPicture.asset(Assets.icons.google, height: 80.h),
//                 // SvgPicture.asset(Assets.icons.apple, height: 80.h),
//                 // SvgPicture.asset(Assets.icons.facebook, height: 80.h),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 40.h, bottom: 11.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       height: 1,
//                       thickness: 1,
//                       indent: 24.w,
//                       endIndent: 11.w,
//                       color: AppColors.black.withOpacity(.2),
//                     ),
//                   ),
//                   Text(
//                     'Already have an account?',
//                     style: AppTextStyles.body16w5
//                         .copyWith(color: AppColors.unActText),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       height: 1,
//                       thickness: 1,
//                       indent: 11.w,
//                       endIndent: 24.w,
//                       color: AppColors.black.withOpacity(.2),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 'Sign in',
//                 style: AppTextStyles.body18w7.copyWith(color: AppColors.blue),
//               ),
//             ),
//             SizedBox(
//               height: 38.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text(
//                   'Terms of use',
//                   style: AppTextStyles.body16w5.copyWith(color: AppColors.blue),
//                 ),
//                 Text(
//                   'Privacy Policy',
//                   style: AppTextStyles.body16w5.copyWith(color: AppColors.blue),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<dynamic> bottomSheets(BuildContext context) {
//     return showModalBottomSheet(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       context: context,
//       builder: (_) {
//         final defaultPinTheme = PinTheme(
//           width: 77.w,
//           height: 89.h,
//           textStyle: AppTextStyles.body37w5.copyWith(color: AppColors.white),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: AppColors.unActText,
//             ),
//             borderRadius: BorderRadius.circular(18.r),
//           ),
//         );

//         final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//           borderRadius: BorderRadius.circular(18.r),
//           border: Border.all(
//             color: isError == true ? AppColors.green : AppColors.blue,
//           ),
//           color: AppColors.blue,
//         );

//         return Container(
//           decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(26.r),
//                   topRight: Radius.circular(26.r))),
//           child: ListView(
//             physics: const NeverScrollableScrollPhysics(),
//             padding: EdgeInsets.only(
//                 left: 24.w,
//                 right: 24.w,
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             shrinkWrap: true,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
//                 child: Center(
//                   child: Divider(
//                     indent: 151.w,
//                     endIndent: 151.w,
//                     thickness: 4.h,
//                     height: 4.h,
//                     color: AppColors.unActText,
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Verify phone',
//                     style: AppTextStyles.body20w7.copyWith(
//                       color: AppColors.textfield,
//                     ),
//                   ),
//                   Text(
//                     'Close',
//                     style:
//                         AppTextStyles.body18w4.copyWith(color: AppColors.blue),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.w, top: 24.h, bottom: 9.h),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text('Phone number',
//                       style: AppTextStyles.body14w4
//                           .copyWith(color: AppColors.unActText)),
//                 ),
//               ),
//               CustomTextField(
//                 hintText: 'Phone',
//                 controller: phone,
//                 isPassword: false,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 14, bottom: 34.h),
//                 child: Text(
//                     'We will send you a verification code to a new number',
//                     style: AppTextStyles.body18w4
//                         .copyWith(color: AppColors.unActText)),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 child: Pinput(
//                   defaultPinTheme: defaultPinTheme,
//                   focusedPinTheme: focusedPinTheme,
//                   submittedPinTheme: focusedPinTheme,
//                   length: 4,
//                   validator: (s) {
//                     setState(() {
//                       isNext = true;
//                     });
//                     // _sendSMS(s.toString());
//                     return null;
//                   },
//                   focusNode: _pinPutFocusNode,
//                   controller: _pinPutController,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 67.h, bottom: 68.h),
//                 child: CustomButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (_) => const RegNewUserPage()));
//                   },
//                   color: AppColors.white,
//                   text: 'Send',
//                   borderColor: AppColors.blue,
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
