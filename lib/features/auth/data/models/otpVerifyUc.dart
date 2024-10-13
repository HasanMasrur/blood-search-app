// ignore: file_names
class OtpVerifyUc {
  final int otpCode;
  final String phoneNumber;

  OtpVerifyUc({
    required this.otpCode,
    required this.phoneNumber,
  });

  // Factory method to create an instance from JSON
  factory OtpVerifyUc.fromJson(Map<String, dynamic> json) {
    return OtpVerifyUc(
      otpCode: json['otp_code'],
      phoneNumber: json['phone_number'],
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'otp_code': otpCode,
      'phone_number': phoneNumber,
    };
  }
}
