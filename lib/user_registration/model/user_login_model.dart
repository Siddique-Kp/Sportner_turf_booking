
import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
    UserLoginModel({
        this.mobile,
        this.password,
    });

    String? mobile;
    String? password;

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        mobile: json["mobile"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "password": password,
    };
}



