class RouteName {
  static RouteName? _instance;
  // Avoid self instance
  RouteName._();
  static RouteName get instance => _instance ??= RouteName._();

  static Future<String> get initialRoute async {
    return launcherScreen;
  }

  static const String launcherScreen = '/';
  static const String loginScreen = "/loginScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String otpVerifyScreen = '/otpVerifyScreen';
  static const String dashboardScreen = "/dashboardScreen";
}
