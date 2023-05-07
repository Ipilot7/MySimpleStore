import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/config/constants/local_data.dart';

import 'drawer_button.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key, required this.controller});
  final PageController controller;

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
                  backgroundImage: AssetImage('assets/images/defAvatar.jpg'),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Baxtiyor',
                  style:
                      AppTextStyles.body20w5.copyWith(color: AppColors.white),
                ),
                SizedBox(height: 30.h),
              ],
            ),
            Column(
              children: List.generate(
                pages.length,
                (index) => GestureDetector(
                    onTap: () {
                      _onItemTapped(index);
                      ZoomDrawer.of(context)!.close();
                    },
                    child: DraverButton(
                        icon: pageIcons[index], text: pageNames[index])),
              ),
            ),
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

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 2) {
      showDialogInfo(context);
    } else {
      widget.controller.animateToPage(selectedIndex,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }

  Future<dynamic> showDialogInfo(BuildContext context) {
    return showDialog(
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
                      textStyle: const TextStyle(fontSize: 15)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ок')),
            ],
          ),
        ],
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
