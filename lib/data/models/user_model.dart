import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:const_date_time/const_date_time.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  final String name;
  final String email;
  final int number;
  final String password;
  final String passwordRepeat;
  final String accessToken;
  final String refreshToken;

  const UserModel({
    required this.name,
    required this.email,
    required this.number,
    required this.password,
    required this.passwordRepeat,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        number: json["number"],
        password: json["password"],
        passwordRepeat: json["password_repeat"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "number": number,
        "password": password,
        "password_repeat": passwordRepeat,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };

  @override
  String toString() {
    return """UserName: $name ---------------------------,
    UserNumber: $number -----------------------------,
     UserPassword: $password -----------------------,
     UserEmail: $email -------------------------------,
      Access_token: $accessToken------------------------,
    Refresh_token": $refreshToken------------,
     """;
  }

  static const dateTime = ConstDateTime(2022, 10, 27, 12, 34, 56, 789, 10);

  @override
  List<Object> get props => [number];

  static const empty = UserModel(
      name: "-",
      email: "-",
      number: 0,
      password: "-",
      passwordRepeat: "-",
      accessToken: "-",
      refreshToken: "-");
}
