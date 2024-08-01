import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'route/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: const QRouteInformationParser(),
      routerDelegate: QRouterDelegate(AppRoutes.routes),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white, surfaceTintColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red
      ),
    );
  }
}
