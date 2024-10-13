import 'package:bloodsearchapp/config/di/dependency_injector.dart';
import 'package:bloodsearchapp/config/navigation/route_name.dart';
import 'package:bloodsearchapp/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:bloodsearchapp/features/auth/presentation/pages/login_screen.dart';
import 'package:bloodsearchapp/features/auth/presentation/pages/otp_screen.dart';
import 'package:bloodsearchapp/features/auth/presentation/pages/signup_screen.dart';
import 'package:bloodsearchapp/features/launcher/presentation/pages/launcher_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (_) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
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
