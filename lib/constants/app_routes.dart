import 'package:flutter/material.dart';

import '../presentation_layer/screens/auth_screens/login.dart';
import '../presentation_layer/screens/splash_screen/splash_screen.dart';

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 3000);

  CustomPageRoute({builder}) : super(builder: builder);
}

class AppRoutes {
  static const String splashScreen = '/';
  static const String login = 'login';

  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case login:
        return CustomPageRoute(
          builder: (context) => const Login(),
        );
    }
    return null;
  }
}
