class UserLoginModel {
  String? accessToken;
  String? name;
  String? mobile;

  UserLoginModel({this.accessToken, this.name, this.mobile});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    name = json['name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['accessToken'] = accessToken;
    data['name'] = name;
    data['mobile'] = mobile;
    return data;
  }
}