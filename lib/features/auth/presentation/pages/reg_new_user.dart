import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_simple_store/features/auth/domain/entities/registration_model.dart';
import 'package:my_simple_store/features/auth/presentation/widgets/custom_bottom_sheet.dart';

import '../../../../config/constants/all_constants.dart';
import '../bloc/registration/registration_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegNewUserPage extends StatefulWidget {
  const RegNewUserPage({super.key});

  @override
  State<RegNewUserPage> createState() => _RegNewUserPageState();
}

class _RegNewUserPageState extends State<RegNewUserPage> {
  TextEditingController username = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          if (state is RegistrationLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RegistrationLoadedState) {
            showModalBottomSheet(context: context, builder: (context) => CustomBottomSheet( email: email.text),);
            return Center(
              child: Text(
                state.result,
                style: AppTextStyles.body22w4,
              ),
            );
          } else if (state is RegistrationErrorState) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.body22w4,
              ),
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 61.h, bottom: 37.h),
                    child: Text('Sign up',
                        style: AppTextStyles.head34w9
                            .copyWith(color: AppColors.blue)),
                  ),
                  CustomTextField(
                    hintText: 'First Name',
                    controller: username,
                    title: 'First Name*',
                    isPassword: false,
                  ),
                  CustomTextField(
                    hintText: 'Last Name',
                    controller: lastname,
                    title: 'Last Name*',
                    isPassword: false,
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    controller: email,
                    title: 'Email*',
                    isPassword: false,
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    controller: password,
                    title: 'Password',
                    isPassword: false,
                  ),
                  CustomTextField(
                    hintText: "Repeat password",
                    controller: repeatPassword,
                    title: 'Headline',
                    isPassword: false,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 56.h, bottom: 58.h),
                    child: CustomButton(
                      onPressed: () {
                        if (username.text.isEmpty ||
                            lastname.text.isEmpty ||
                            email.text.isEmpty) {
                          showCustomDialog(
                              context, "Ma'lumotlarini  to'liq to'ldiring");
                        } else if (password.text != repeatPassword.text) {
                          showCustomDialog(context, "Parolni qayta kiriting");
                        } else {
                          context.read<RegistrationBloc>().add(
                                RegistrationAccountEvent(
                                  registrationModel: RegistrationModel(
                                    username: username.text,
                                    lastname: lastname.text,
                                    email: email.text,
                                    password: password.text,
                                  ),
                                ),
                              );
                        }
                      },
                      text: 'Continue',
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<dynamic> showCustomDialog(BuildContext context, String text) {
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        // return AlertDialog(
        //   title: Text(
        //     text,
        //     style: AppTextStyles.body20w5,
        //   ),
        //   actions: [
        //     TextButton(
        //       onPressed: () => Navigator.pop(context),
        //       child: Text(
        //         'OK',
        //         style: AppTextStyles.body24wB,
        //       ),
        //     )
        //   ],
        // );
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Center(
            child: Container(
              height: 200.h,
              width: 200.w,
              // margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 250.h),
              padding: EdgeInsets.all(15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.white,
              ),
              child: Text(
                text,
                style: AppTextStyles.body20w5,
              ),
            ),
          ),
        );
      },
    );
  }
}
