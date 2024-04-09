import 'package:flutter/material.dart';
import 'package:job_app_admin/provider/home/DashBoardState.dart';
import 'package:job_app_admin/provider/home/features/addJobstate.dart';
import 'package:job_app_admin/provider/user/login_state.dart';
import 'package:job_app_admin/provider/user/register_state.dart';
import 'package:job_app_admin/screens/home/dashboard/dashboard.dart';
import 'package:job_app_admin/screens/home/features/add_job.dart';
import 'package:job_app_admin/screens/splash/splash_screen.dart';
import 'package:job_app_admin/screens/user/login_screen.dart';
import 'package:job_app_admin/screens/user/register_screen.dart';
import 'package:job_app_admin/themes/app_themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().lightTheme,
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/loginScreen': (context) => ChangeNotifierProvider(
              create: (_) => LoginState(),
              child: LoginScreen(),
            ),
        '/registerScreen': (context) => ChangeNotifierProvider(
              create: (_) => RegisterState(),
              child: RegisterScreen(),
            ),
        '/dashboard': (context) => ChangeNotifierProvider(
              create: (_) => DashBoardState(),
              child: DashboardScreen(),
            ),
        '/addJobScreen': (context) => ChangeNotifierProvider(
              create: (_) => AddJobState(),
              child: AddJob(),
            ),
      },
    );
  }
}
