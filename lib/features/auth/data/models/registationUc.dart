// To parse this JSON data, do
//
//     final registrationUc = registrationUcFromJson(jsonString);

import 'dart:convert';

RegistrationUc registrationUcFromJson(String str) =>
    RegistrationUc.fromJson(json.decode(str));

String registrationUcToJson(RegistrationUc data) => json.encode(data.toJson());

class RegistrationUc {
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
  String shopName;
  String type;
  int packageId;

  RegistrationUc({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.shopName,
    required this.type,
    required this.packageId,
  });

  factory RegistrationUc.fromJson(Map<String, dynamic> json) => RegistrationUc(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      shopName: json["shopName"],
      type: json["type"],
      packageId: json['package_id']);

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "shopName": shopName,
        "type": type,
        "package_id": packageId
      };
}
