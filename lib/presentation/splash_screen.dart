import 'package:flutter/material.dart';
import 'package:flutterapp/route/routes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      QR.replace(AppRoutes.rootPath, AppRoutes.loginPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    // from url
    // return Scaffold(
    //   body: Center(
    //     child: Image.network(
    //       'https://techtroops.co.id/wp-content/uploads/2023/07/Asset-1@4x.png',
    //       width: 200, // Adjust the width as needed
    //       height: 200, // Adjust the height as needed
    //     ),
    //   ),
    // );

    // from assets folder
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/om-logo.png',
          width: 300, // Adjust the width as needed
          height: 300, // Adjust the height as needed
        ),
      ),
    );
  }
}
