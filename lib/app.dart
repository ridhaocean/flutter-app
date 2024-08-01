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
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, surfaceTintColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red,
        popupMenuTheme: const PopupMenuThemeData(
          color: Colors
              .white, // Set the background color of the popup menu to white
        ),
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            size: Size(
              MediaQuery.of(context).size.width.clamp(0.0, 430.0),
              MediaQuery.of(context).size.height.clamp(0.0, 932.0),
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 430,
                maxHeight: 932,
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
