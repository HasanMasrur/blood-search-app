// To parse this JSON data, do
//
//     final logInUc = logInUcFromJson(jsonString);

import 'dart:convert';

LogInUc logInUcFromJson(String str) => LogInUc.fromJson(json.decode(str));

String logInUcToJson(LogInUc data) => json.encode(data.toJson());

class LogInUc {
  String countryCode;
  String phone;
  String password;

  LogInUc({
    required this.countryCode,
    required this.phone,
    required this.password,
  });

  factory LogInUc.fromJson(Map<String, dynamic> json) => LogInUc(
        countryCode: json["country_code"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "phone": phone,
        "password": password,
      };
}
