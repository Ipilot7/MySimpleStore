import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/presentation/routes/routes.dart';

void main() => runApp(
      ScreenUtilInit(
        designSize: const Size(393, 852),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme:
                  AppBarTheme(toolbarTextStyle: AppTextStyles.body37w5),
              fontFamily: 'DancingScript',
              primarySwatch: Colors.indigo,
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  extendedTextStyle: AppTextStyles.body18w5,
                  backgroundColor: Colors.indigo)),
          onGenerateRoute: (settings) => Routes.generateRoute(settings),
        ),
      ),
    );
