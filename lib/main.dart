import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/presentation/routes/routes.dart';

void main() => runApp(ScreenUtilInit(
      designSize: const Size(393, 852),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: (settings) => Routes.generateRoute(settings),
      ),
    ));
