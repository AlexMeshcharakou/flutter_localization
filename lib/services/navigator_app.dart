import 'package:flutter/material.dart';
import 'package:module_nine/screens/HomeScreen.dart';
import 'package:module_nine/screens/SecondScreen.dart';
import 'package:module_nine/services/app_routes.dart';

class NavigatorApp extends StatelessWidget {
  const NavigatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: generateRoute,
    );
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) =>
              HomeScreen(inputData: settings.arguments as String?),
        );
      case AppRoutes.secondScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const SecondScreen(),
        );
    }
    return null;
  }
}
