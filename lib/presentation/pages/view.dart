import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/assets.dart';
import 'package:my_simple_store/presentation/pages/home.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade500],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
          SafeArea(
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: Image.asset(Assets.images.defAvatar),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'User ID',
                            style: AppTextStyles.body20w5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Info'),
                      const Text('data'),
                      const Text('data'),
                      SizedBox(height: 300.h),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            onPressed: () {
                              _exitAppShowDialog(context);
                            },
                            child: const Text('Выход')),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              curve: Curves.easeInExpo,
              duration: const Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: const HomePage());
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }

  Future<dynamic> _exitAppShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        title: const Text(
          'Хотите выйти из программы',
          textAlign: TextAlign.center,
        ),
        contentTextStyle: AppTextStyles.body18w5,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: const Text('Да'),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Нет'),
            ),
          ],
        ),
      ),
    );
  }
}
