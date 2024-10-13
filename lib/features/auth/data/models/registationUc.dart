class RegistrationUc {
  final String? appKey;
  final String countryCode;
  final String phoneNumber;
  final String fullName;
  final String gender;
  final String dateOfBirth;
  final String bloodGroup;
  final String password;

  RegistrationUc({
    this.appKey,
    required this.countryCode,
    required this.phoneNumber,
    required this.fullName,
    required this.gender,
    required this.dateOfBirth,
    required this.bloodGroup,
    required this.password,
  });

  // Factory constructor to create an instance from a JSON map
  factory RegistrationUc.fromJson(Map<String, dynamic> json) {
    return RegistrationUc(
      appKey: json['app_key'],
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
      fullName: json['full_name'],
      gender: json['gender'],
      dateOfBirth: json['date_of_birth'],
      bloodGroup: json['blood_group'],
      password: json['password'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'app_key': appKey,
      'country_code': countryCode,
      'phone_number': phoneNumber,
      'full_name': fullName,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'blood_group': bloodGroup,
      'password': password,
    };
  }

  // CopyWith method to create a modified copy of the instance
  RegistrationUc copyWith({
    String? appKey,
    String? countryCode,
    String? phoneNumber,
    String? fullName,
    String? gender,
    String? dateOfBirth,
    String? bloodGroup,
    String? password,
  }) {
    return RegistrationUc(
      appKey: appKey ?? this.appKey,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      password: password ?? this.password,
    );
  }
}
