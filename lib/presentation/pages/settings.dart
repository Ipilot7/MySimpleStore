import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/presentation/widgets/custom_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int selLanguage = 0;
  int selCurrency = 0;
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
        title: const Text('Настройка'),
      ),
      body: ListView(
        children: [
          CustomCard(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage:
                        const AssetImage('assets/images/defAvatar.jpg'),
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
          const CustomCard(child: Text('Премиум - версия')),
          const CustomCard(child: Text('Долги')),
          const CustomCard(child: Text('Категории')),
          const CustomCard(child: Text('Экспорт')),
          const CustomCard(child: Text('Основная валюта')),
        ],
      ),
    );
  }
}
