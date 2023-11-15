import 'package:flutter/material.dart';

import '../presentation_layer/screens/auth_screens/auth_body.dart';
import '../presentation_layer/screens/splash_screen/splash_screen.dart';

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 3000);

  CustomPageRoute({builder}) : super(builder: builder);
}

class AppRoutes {
  static const String splashScreen = '/';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String authBody = 'authBody';

  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case authBody:
        return CustomPageRoute(
          builder: (context) => const AuthBody(),
        );
    }
    return null;
  }
}
