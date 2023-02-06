import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/pages/income.dart';
import 'package:my_simple_store/presentation/pages/view.dart';

class Routes {
  static const viewPage = '/viewPage';
  static const incomePage = '/incomePage';

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
        case incomePage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => IncomePage(
              isTrue: args?['isTrue'],
            ),
          );

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
