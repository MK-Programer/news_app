import 'package:flutter/material.dart';
import 'package:news_app/resources/string_manager.dart';
import '../screens/main_screen.dart';

class Routes {
  static const String mainRoute = '/MainScreen';
  static const String homeRoute = '/HomeScreen';
  static const String newsDetailsRoute = '/NewsDetailsScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            AppString.noRouteFound,
          ),
        ),
      ),
    );
  }
}
