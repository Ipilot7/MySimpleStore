import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/pages/add_category.dart';
import 'package:my_simple_store/presentation/pages/add_product.dart';
import 'package:my_simple_store/presentation/pages/view.dart';
import 'package:my_simple_store/presentation/pages/view_product.dart';

class Routes {
  static const viewPage = '/viewPage';
  static const addProductsPage = '/addProductsPage';
  static const addCategory = '/addCategory';
  static const viewProductPage = '/viewProductPage';

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
        case addProductsPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const AddProductsPage(),
          );
        case addCategory:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const AddCategoryPage(),
          );
        case viewProductPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const ViewProductPage(),
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
