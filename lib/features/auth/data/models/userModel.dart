// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:bloodsearchapp/features/auth/domain/entities/user_entities.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

// ignore: must_be_immutable
class UserModel extends UserEntities {
  User user;
  String accessToken;
  UserModel({
    required this.user,
    required this.accessToken,
  }) : super(user: user, accessToken: accessToken);
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["accessToken"],
        user: User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "data": user.toJson(),
      };
}

class User {
  String id;
  String phone;
  String fullName;
  String countryCode;
  String dateOfBirth;
  String gender;
  String bloodGroup;
  int v;

  User({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.countryCode,
    required this.dateOfBirth,
    required this.gender,
    required this.bloodGroup,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] ?? "",
        phone: json["phone"] ?? "",
        fullName: json["full_name"] ?? "",
        countryCode: json["country_code"] ?? "",
        dateOfBirth: json["date_of_birth"] ?? "",
        gender: json["gender"] ?? "",
        bloodGroup: json["blood_group"] ?? "",
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone": phone,
        "full_name": fullName,
        "country_code": countryCode,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "blood_group": bloodGroup,
        "__v": v,
      };
}
