// To parse this JSON data, do
//
//     final userSignupModel = userSignupModelFromJson(jsonString);

import 'dart:convert';

UserSignupModel userSignupModelFromJson(String str) =>
    UserSignupModel.fromJson(json.decode(str));

String userSignupModelToJson(UserSignupModel data) =>
    json.encode(data.toJson());

class UserSignupModel {
  UserSignupModel({
    this.name,
    this.mobile,
    this.password,
    this.accessToken,
  });

  String? name;
  String? mobile;
  String? password;
  String? accessToken;

  factory UserSignupModel.fromJson(Map<String, dynamic> json) =>
      UserSignupModel(
        name: json["name"],
        mobile: json["mobile"],
        password: json["password"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "password": password,
      };
}
