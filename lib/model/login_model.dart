import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  int id;
  dynamic username;
  dynamic password;
  String token;
  String message;
  dynamic authType;
  dynamic ipAddress;

  LoginModel({
    required this.id,
    this.username,
    this.password,
    required this.token,
    required this.message,
    this.authType,
    this.ipAddress,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        token: json["token"] ?? "",
        message: json["message"],
        authType: json["authType"],
        ipAddress: json["ipAddress"],
      );
}
