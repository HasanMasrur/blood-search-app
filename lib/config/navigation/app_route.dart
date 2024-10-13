import 'package:bloodsearchapp/config/navigation/route_name.dart';
import 'package:bloodsearchapp/features/auth/presentation/pages/login_screen.dart';
import 'package:bloodsearchapp/features/auth/presentation/pages/otp_screen.dart';
import 'package:bloodsearchapp/features/auth/presentation/pages/signup_screen.dart';
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
      case RouteName.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );
      case RouteName.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
          settings: settings,
        );
      case RouteName.otpVerifyScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpVerifyScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const LauncherScreen(),
          settings: settings,
        );
    }
  }
}
