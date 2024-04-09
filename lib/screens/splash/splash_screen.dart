import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:job_app_admin/common/constant/app_images.dart';
import 'package:job_app_admin/main.dart';
import 'package:job_app_admin/services/local%20Storage/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      goto();
    });
  }

  void goto() async {
    var accessTkn = await localStorage.read('token');
    if (accessTkn != null) {
      navigatorKey.currentState!.pushReplacementNamed('/dashboard');
    } else if (accessTkn == null) {
      navigatorKey.currentState!.pushReplacementNamed('/loginScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'hero',
              child: Container(
                height: 100,
                child: Image.asset(logoImage),
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
