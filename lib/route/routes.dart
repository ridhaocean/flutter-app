import 'package:flutterapp/presentation/detail_page.dart' deferred as detail;
import 'package:flutterapp/presentation/home_page.dart' deferred as home;
import 'package:flutterapp/presentation/login_page.dart' deferred as login;
import 'package:flutterapp/presentation/splash_screen.dart'
    deferred as splash_screen;
import 'package:qlevar_router/qlevar_router.dart';

import 'deferred_loader.dart';

class AppRoutes {
  static const rootPath = "/"; // splash screen route
  static const loginPath = "/login";
  static const homePath = "/home";
  static const detailPath = "/detail";

  static const homeRouteName = "home";
  static const detailRouteName = "detail";

  static final routes = [
    QRoute(
      path: rootPath,
      builder: () => splash_screen.SplashScreen(),
      middleware: [DeferredLoader(splash_screen.loadLibrary)],
    ),
    QRoute(
      path: loginPath,
      builder: () => login.LoginPage(),
      middleware: [DeferredLoader(login.loadLibrary)],
    ),
    QRoute(
      path: homePath,
      builder: () => home.HomePage(),
      middleware: [DeferredLoader(home.loadLibrary)],
    ),
    QRoute(
      name: detailRouteName,
      path: detailPath,
      builder: () => detail.DetailPage(),
      middleware: [DeferredLoader(detail.loadLibrary)],
    ),
  ];
}
