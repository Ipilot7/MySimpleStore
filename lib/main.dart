
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/presentation/pages/view_page.dart';
import 'package:my_simple_store/presentation/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: const Size(393, 852),
        splitScreenMode: true,
        minTextAdapt: true, builder: (_,child)=>MaterialApp(
      title: 'Wallefy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ViewPage(),
      onGenerateRoute: (settings) =>Routes.generateRoute(settings) ,
    ),);
   
  }
}
