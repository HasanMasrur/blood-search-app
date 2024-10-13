class ApiEndPoints {
  ApiEndPoints._privateConstructor();
  static final ApiEndPoints instance = ApiEndPoints._privateConstructor();
  static const String baseUrl = "http://localhost:3000/api/";
  static const String login = "user/login";
  static const String sendOtp = "auth/send-otp";
  static const String otpVerifyed = "auth/otp-verify";
}
