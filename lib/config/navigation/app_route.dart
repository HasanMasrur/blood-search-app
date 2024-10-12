import 'package:bloodsearchapp/config/navigation/route_name.dart';
import 'package:bloodsearchapp/features/launcher/presentation/pages/launcher_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.launcherScreen:
        return MaterialPageRoute(
          builder: (_) => const LauncherScreen(),
          settings: settings,
        );
      // case RouteName.leandingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const LeandingScreen(),
      //     settings: settings,
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => const LauncherScreen(),
          settings: settings,
        );
    }
  }
}
