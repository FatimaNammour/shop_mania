import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:const_date_time/const_date_time.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  final String role;
  final String id;
  final String name;
  final String email;
  final int number;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserModel({
    required this.role,
    required this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        role: json["role"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        number: json["number"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "_id": id,
        "name": name,
        "email": email,
        "number": number,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };

  @override
  String toString() {
    return """UserName: $name ---------------------------,
    UserNumber: $number -----------------------------,
     UserPassword: $password -----------------------,
     UserEmail: $email -------------------------------,
      createdAt: $createdAt --------------------------,
      updatedAt: $updatedAt--------------------------""";
  }

  static const dateTime = ConstDateTime(2022, 10, 27, 12, 34, 56, 789, 10);

  @override
  List<Object> get props => [id];

  static const empty = UserModel(
    role: "-",
    id: "-",
    name: "-",
    email: "-",
    number: 0,
    password: "-",
    createdAt: dateTime,
    updatedAt: dateTime,
  );
}
