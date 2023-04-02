class UserLoginModel {
  String? mobile;
  String? password;
  String? accessToken;
  String? name;

  UserLoginModel({
    this.mobile,
    this.password,
    this.accessToken,
    this.name,
  });

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
    accessToken = json['accessToken'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['mobile'] = mobile;
    data['password'] = password;
    data['accessToken'] = accessToken;
    data['name'] = name;
    return data;
  }
}


