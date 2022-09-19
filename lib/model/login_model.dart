// To parse this JSON data, do
//
//     final taskLoginModel = taskLoginModelFromJson(jsonString);

import 'dart:convert';

TaskLoginModel taskLoginModelFromJson(String str) => TaskLoginModel.fromJson(json.decode(str));


class TaskLoginModel {
  TaskLoginModel({
    this.statusCode,
    this.success,
    this.message,
    this.model,
    this.meta,
    this.errors,
  });

  int? statusCode;
  bool? success;
  String? message;
  Model? model;
  dynamic meta;
  dynamic errors;

  factory TaskLoginModel.fromJson(Map<String, dynamic> json) => TaskLoginModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    model: Model.fromJson(json["model"]),
    meta: json["meta"],
    errors: json["errors"],
  );

}

class Model {
  Model({
    this.user,
    this.tokens,
    this.completeRegisterationToken,
  });

  User? user;
  Tokens? tokens;
  dynamic completeRegisterationToken;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    user: User.fromJson(json["user"]),
    tokens: Tokens.fromJson(json["tokens"]),
    completeRegisterationToken: json["completeRegisterationToken"],
  );

}

class Tokens {
  Tokens({
    this.accessToken,
    this.refreshToken,
  });

  String? accessToken;
  RefreshToken? refreshToken;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    accessToken: json["accessToken"],
    refreshToken: RefreshToken.fromJson(json["refreshToken"]),
  );

}

class RefreshToken {
  RefreshToken({
    this.username,
    this.tokenString,
    this.expireAt,
  });

  String? username;
  String? tokenString;
  DateTime? expireAt;

  factory RefreshToken.fromJson(Map<String, dynamic> json) => RefreshToken(
    username: json["username"],
    tokenString: json["tokenString"],
    expireAt: DateTime.parse(json["expireAt"]),
  );

}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.status,
    this.language,
    this.phone,
    this.details,
    this.birthDate,
    this.profileImagePath,
    this.userRoles,
    this.talkingLanguage,
    this.nationality,
    this.company,
    this.trucks,
  });

  String? id;
  String? name;
  dynamic email;
  bool? status;
  String? language;
  String? phone;
  dynamic details;
  DateTime? birthDate;
  dynamic profileImagePath;
  List<UserRole>? userRoles;
  TalkingLanguage? talkingLanguage;
  Nationality? nationality;
  dynamic company;
  List<dynamic>? trucks;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    status: json["status"],
    language: json["language"],
    phone: json["phone"],
    details: json["details"],
    birthDate: DateTime.parse(json["birthDate"]),
    profileImagePath: json["profileImagePath"],
    userRoles: List<UserRole>.from(json["userRoles"].map((x) => UserRole.fromJson(x))),
    talkingLanguage: TalkingLanguage.fromJson(json["talkingLanguage"]),
    nationality: Nationality.fromJson(json["nationality"]),
    company: json["company"],
    trucks: List<dynamic>.from(json["trucks"].map((x) => x)),
  );

}

class Nationality {
  Nationality({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class TalkingLanguage {
  TalkingLanguage({
    this.id,
    this.name,
    this.native,
    this.code,
  });

  String? id;
  String? name;
  String? native;
  String? code;

  factory TalkingLanguage.fromJson(Map<String, dynamic> json) => TalkingLanguage(
    id: json["id"],
    name: json["name"],
    native: json["native"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "native": native,
    "code": code,
  };
}

class UserRole {
  UserRole({
    this.role,
  });

  Role? role;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
    role: Role.fromJson(json["role"]),
  );

}

class Role {
  Role({
    this.name,
  });

  String? name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
