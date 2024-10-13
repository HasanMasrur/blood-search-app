import 'dart:developer';
import 'package:bloodsearchapp/features/auth/data/models/userModel.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntities extends Equatable {
  User user;
  String accessToken;
  UserEntities({
    required this.user,
    required this.accessToken,
  });
  Map<String, dynamic> toMap() {
    return {
      'user': user.toJson(),
      'accessToken': accessToken,
    };
  }

  factory UserEntities.initial() {
    return UserEntities(
        user: User(
            id: '',
            phone: '',
            fullName: '',
            countryCode: '',
            dateOfBirth: '',
            gender: '',
            bloodGroup: '',
            v: 0),
        accessToken: '');
  }
  @override
  String toString() {
    return 'TodoEntities{: , ,}';
  }

  factory UserEntities.fromJson(Map<String, dynamic> map) {
    log(map.toString());
    return UserEntities(
      user: User.fromJson(map['user']),
      accessToken: map['accessToken'],
    );
  }

  // factory UserEntities.fromJson(Map<String,dynamic> source) =>
  //     UserEntities.fromMap(source);

  UserEntities copyWith({
    User? user,
    String? accessToken,
  }) {
    return UserEntities(
        user: user ?? this.user, accessToken: accessToken ?? this.accessToken);
  }

  @override
  List<Object?> get props => [];
}
