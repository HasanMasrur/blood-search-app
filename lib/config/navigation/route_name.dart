class RouteName {
  static RouteName? _instance;
  // Avoid self instance
  RouteName._();
  static RouteName get instance => _instance ??= RouteName._();

  static Future<String> get initialRoute async {
    return splash;
  }

  static const String splash = '/';
  static const String loginScreen = '/loginScreen';
  static const String registationScreen = '/registationScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';

  static const String verifyOTPScreen = '/verifyOTPScreen';

  static const String shopUpdateScreen = "/shopUpdateScreen";
  static const String dashboard = "/dashboard";
  static const String imageBucketScreen = "/imageBucketScreen";
  static const String categoryScreen = "/categoryScreen";
  static const String orderScreen = "/orderScreen";
  static const String editOrderScreen = "/editOrderScreen";
  static const String termsAndConsScreen = '/termsAndConsScreen';
  static const String privacyAndPolicyScreen = '/privacyAndPolicyScreen';
  static const String categoryCreateScreen = "/categoryCreateScreen";
  static const String onboardingScreen = "/onboardingScreen";
  static const String leandingScreen = "/leandingScreen";
  static const String packageSelectScreen = "/packageSelectScreen";
  static const String productScreen = "/productScreen";
  static const String createproductScreen = "/createproductScreen";
  static const String updateProductScreen = "/updateProductScreen";

  static const String createbrandScreen = "/createbrandScreen";
  static const String createOrderScreen = "/createOrderScreen";
  static const String brandScreen = "/brandScreen";
}
