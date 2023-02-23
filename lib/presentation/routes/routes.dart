import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/pages/add_data.dart';
import 'package:my_simple_store/presentation/pages/edit_data.dart';
import 'package:my_simple_store/presentation/pages/view_page.dart';

class Routes {
  static const viewPage = '/viewPage';
  static const addDataPage = '/addDataPage';
  static const editData = '/editData';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case viewPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const ViewPage(),
          );
        case addDataPage:
          return MaterialPageRoute(
              settings: routeSettings,
              builder: (_) => AddData(
                    isTrue: args?['isTrue'],
                  ));
        case editData:
          return MaterialPageRoute(
              settings: routeSettings,
              builder: (_) => EditData(
                    user: args?['user'],
                  ));

        default:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const ViewPage(),
          );
      }
    } catch (e) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewPage(),
      );
    }
  }
}
