import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_simple_store/config/routes/routes.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
import '../bloc/sign_in/sign_in_bloc.dart';
import '../widgets/custom_textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SignInLoadedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.result.username ?? '',
                      style: AppTextStyles.body16w5),
                  Text(state.result.email ?? '', style: AppTextStyles.body16w5),
                  Text(state.result.lastname ?? '',
                      style: AppTextStyles.body16w5),
                  Text(state.result.token ?? '', style: AppTextStyles.body16w5),
                  Text(state.result.sId ?? '', style: AppTextStyles.body16w5),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(top: 58.h, bottom: 14.h),
                  //   child: Center(
                  //     child: RichText(
                  //       textAlign: TextAlign.center,
                  //       text: TextSpan(
                  //         text: "90% of the application is sold\nfor ",
                  //         style: AppTextStyles.body18w4
                  //             .copyWith(color: AppColors.unActText),
                  //         children: [
                  //           TextSpan(
                  //             text: '\ 000 000.00',
                  //             style: AppTextStyles.body18w4
                  //                 .copyWith(color: AppColors.green),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Image.asset(
                  //   Assets.images.logo,
                  //   height: 87.h,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 12.h, bottom: 73.h),
                  //   child: Text(
                  //     'Football Fantasy Lague',
                  //     style: AppTextStyles.body18w7.copyWith(color: AppColors.blue),
                  //   ),
                  // ),
                  SizedBox(height: 300.h),
                  CustomTextField(
                    hintText: 'Email',
                    controller: email,
                    isPassword: false,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 38.h),
                    child: CustomTextField(
                      hintText: 'Password',
                      controller: password,
                      isPassword: true,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (email.text.isNotEmpty &&
                                password.text.isNotEmpty) {
                              context.read<SignInBloc>().add(SignInAccountEvent(
                                  email: email.text, code: password.text));
                            }
                            ;
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r))),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 22.h)),
                              textStyle: MaterialStateProperty.all(
                                  AppTextStyles.body20w4)),
                          child: const Text('Sign in'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(Assets.icons.google, height: 80.h),
                        // SvgPicture.asset(Assets.icons.apple, height: 80.h),
                        // SvgPicture.asset(Assets.icons.facebook, height: 80.h),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          indent: 24.w,
                          endIndent: 20.w,
                          color: AppColors.black.withOpacity(.2),
                        ),
                      ),
                      Text(
                        'Don’t have an account?',
                        style: AppTextStyles.body16w5
                            .copyWith(color: AppColors.unActText),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          indent: 20.w,
                          endIndent: 24.w,
                          color: AppColors.black.withOpacity(.2),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 11.h, bottom: 38.h),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => const ForgotPasswordPage()));
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, Routes.regNewUserPage);
                            },
                          style: AppTextStyles.body18w7.copyWith(
                            color: AppColors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Terms of use',
                        style: AppTextStyles.body16w5
                            .copyWith(color: AppColors.blue),
                      ),
                      Text(
                        'Privacy Policy',
                        style: AppTextStyles.body16w5
                            .copyWith(color: AppColors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
