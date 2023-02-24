import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/presentation/components/drawer_button.dart';
import 'package:my_simple_store/presentation/pages/home.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 24,
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      menuBackgroundColor: Colors.teal,
      mainScreen: const HomePage(),
      menuScreen: Theme(
        data: ThemeData.dark(),
        child: Scaffold(
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
                DraverButton(icon: Icons.settings, text: 'Settings'),
                DraverButton(icon: Icons.info, text: 'О программе'),
                SizedBox(height: 20.h),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Message'),
                          content: Text('Your file is saved.'),
                        ),
                      );
                    },
                    child: DraverButton(
                        icon: Icons.exit_to_app_outlined, text: 'Exit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
