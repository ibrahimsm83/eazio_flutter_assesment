import 'package:eazio/presentation/export_presentation.dart';
import 'package:flutter/material.dart';
import 'export_route_management.dart';

class CustomRouteGenerator {
  CustomRouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CustomRouteNames.kInitialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const DashboardPage();
          },
        );
      default:
        return null;
    }
  }
}