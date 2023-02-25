import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/presentation/widgets/custom_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        title: Text('Настройка'),
      ),
      body: ListView(
        children: [
          CustomCard(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage('assets/images/defAvatar.jpg'),
                  ),
                  SizedBox(width: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Baxtiyor', style: AppTextStyles.body20w5),
                      SizedBox(height: 20.h),
                      Text('Botiraliyev', style: AppTextStyles.body20w5),
                    ],
                  ),
                ],
              ),
            ]),
          ),
          CustomCard(
              child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Язык: ',
                  ),
                  Text(
                    'Русский',
                    style: AppTextStyles.body18w5
                        .copyWith(decoration: TextDecoration.underline),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Валюта: ',
                  ),
                  Text(
                    'UZS',
                    style: AppTextStyles.body18w5
                        .copyWith(decoration: TextDecoration.underline),
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
