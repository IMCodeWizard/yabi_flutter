import 'package:flutter/material.dart';
import 'package:yabi_test/screens/not_found_screen.dart';

import '../../../screens/dashboard_screen/dashboard_screen.dart';
import '../../../screens/guest_details_screen/guest_details_screen.dart';

import 'app_routes.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case AppRoutes.guestDetails:
        return MaterialPageRoute(builder: (_) => GuestDetailsScreen(item: args));
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}