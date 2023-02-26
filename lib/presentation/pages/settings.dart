import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/config/constants/local_data.dart';
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
        title: Text('Настройка'),
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
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          content: SizedBox(
                            // height: 300.h,
                            width: 50.w,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: languages.length,
                              itemBuilder: (_, index) => Center(
                                child: InkWell(
                                  onTap: () {
                                    selLanguage = index;
                                    setState(() {
                                      defaultLanguage = languages[selLanguage];
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      height: 30.h,
                                      alignment: Alignment.center,
                                      child: Text(languages[index])),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      defaultLanguage,
                      style: AppTextStyles.body18w5
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Валюта: ',
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: SizedBox(
                              width: 50.w,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: currencies.length,
                                itemBuilder: (_, index) => Center(
                                  child: InkWell(
                                    onTap: () {
                                      selCurrency = index;
                                      setState(() {
                                        defaultCurrency =
                                            currencies[selCurrency];
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        height: 30.h,
                                        alignment: Alignment.center,
                                        child: Text(currencies[index])),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        defaultCurrency,
                        style: AppTextStyles.body18w5
                            .copyWith(decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
