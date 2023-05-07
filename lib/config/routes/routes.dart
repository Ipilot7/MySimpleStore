import 'package:flutter/material.dart';
import 'package:my_simple_store/features/auth/domain/usecases/registration_usecase.dart';
import 'package:my_simple_store/features/auth/presentation/pages/reg_new_user.dart';
import 'package:my_simple_store/features/auth/presentation/pages/signin.dart';
import 'package:my_simple_store/features/auth/presentation/pages/singup.dart';

import '../../features/home/presentation/pages/add_data.dart';
import '../../features/home/presentation/pages/edit_data.dart';
import '../../features/home/presentation/pages/settings.dart';
import '../../features/home/presentation/pages/view_page.dart';

class Routes {
  static const viewPage = '/viewPage';
  static const addDataPage = '/addDataPage';
  static const editData = '/editData';
  static const settings = '/settings';
  static const signInPage = '/';
  static const signUpPage = '/signUpPage';
  static const regNewUserPage = '/regNewUserPage';

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
            ),
          );
        case editData:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => EditData(
              user: args?['user'],
            ),
          );
        case settings:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const SettingsPage(),
          );
        case signInPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const SignInPage(),
          );
        case signUpPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const RegNewUserPage(),
          );
        case regNewUserPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const RegNewUserPage(),
          );
        default:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const RegNewUserPage(),
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
