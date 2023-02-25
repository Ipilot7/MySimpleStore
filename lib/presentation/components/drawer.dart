import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/presentation/components/drawer_button.dart';
import 'package:my_simple_store/presentation/routes/routes.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.teal,
          body: Padding(
            padding: EdgeInsets.only(left: 30.w, top: 60.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage:
                          AssetImage('assets/images/defAvatar.jpg'),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Baxtiyor',
                      style: AppTextStyles.body20w5
                          .copyWith(color: AppColors.white),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
                DraverButton(icon: Icons.person, text: 'Profile'),
                GestureDetector(
                    onTap: () {
                      
                      
                      // Navigator.pushNamed(context, Routes.settings);
                      // ZoomDrawer.of(context)!.stateNotifier;
                    },
                    child:
                        DraverButton(icon: Icons.settings, text: 'Settings')),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Center(child: Text('О программе')),
                          actionsAlignment: MainAxisAlignment.spaceAround,
                          content: Text(
                            'Введение удобного учёта ваших доходов и расходов',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Column(
                              children: [
                                Text('v 1.0'),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.teal,
                                        textStyle:
                                            const TextStyle(fontSize: 15)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Ок')),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    child: DraverButton(icon: Icons.info, text: 'О программе')),
                SizedBox(height: 20.h),
                GestureDetector(
                    onTap: () {
                      callShowDialog(context);
                    },
                    child: DraverButton(
                        icon: Icons.exit_to_app_outlined, text: 'Exit')),
              ],
            ),
          ),
        );
  }
   Future<dynamic> callShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Выйти из программы'),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: () {
                exit(0);
              },
              child: const Text('Да')),
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(fontSize: 15)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Нет')),
        ],
      ),
    );
  }
}