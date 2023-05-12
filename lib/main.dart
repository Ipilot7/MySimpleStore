import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/routes/routes.dart';
import 'package:my_simple_store/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:my_simple_store/features/auth/presentation/pages/signIn.dart';
import 'features/auth/presentation/bloc/registration/registration_bloc.dart';
import 'injection_container.dart' as di;

import 'injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<SignInBloc>()),
          BlocProvider(create: (context) => sl<RegistrationBloc>()),
        ],
        child: MaterialApp(
          title: 'Wallefy',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          // onGenerateRoute: (settings) => Routes.generateRoute(settings),
          home: const SignInPage(),
        ),
      ),
    );
  }
}
