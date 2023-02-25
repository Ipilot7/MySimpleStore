import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_simple_store/presentation/components/drawer.dart';
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
        child: CustomDrawer(),
      ),
    );
  }
}
