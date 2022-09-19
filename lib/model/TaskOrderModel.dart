// To parse this JSON data, do
//
//     final taskOrderModel = taskOrderModelFromJson(jsonString);
import 'dart:convert';

TaskOrderModel taskOrderModelFromJson(String str) =>
    TaskOrderModel.fromJson(json.decode(str));


class TaskOrderModel {
  TaskOrderModel({
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
  List<Model>? model;
  dynamic meta;
  dynamic errors;

  factory TaskOrderModel.fromJson(Map<String, dynamic> json) => TaskOrderModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
    meta: json["meta"],
    errors: json["errors"],
  );

}

class Model {
  Model({
    this.id,
    this.orderImages,
    this.status,
    this.user,
    this.loadingSite,
    this.deliveringSite,
    this.deals,
    this.details,
    this.notes,
    this.price,
    this.weight,
    this.containersNumber,
    this.trucksNumber,
    this.truck,
    this.chatId,
    this.loadedAt,
    this.deliveredAt,
    this.loadingAt,
    this.deliveringAt,
    this.truckSubCategory,
    this.truckCategory,
  });

  String? id;
  List<OrderImage>? orderImages;
  String? status;
  User? user;
  IngSite? loadingSite;
  IngSite? deliveringSite;
  List<dynamic>? deals;
  dynamic details;
  dynamic notes;
  int? price;
  int? weight;
  int? containersNumber;
  int? trucksNumber;
  dynamic truck;
  dynamic chatId;
  DateTime? loadedAt;
  DateTime? deliveredAt;
  DateTime? loadingAt;
  DateTime? deliveringAt;
  TruckCategory? truckSubCategory;
  TruckCategory? truckCategory;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"],
    orderImages: List<OrderImage>.from(json["orderImages"].map((x) => OrderImage.fromJson(x))),
    status: json["status"],
    user: User.fromJson(json["user"]),
    loadingSite: IngSite.fromJson(json["loadingSite"]),
    deliveringSite: IngSite.fromJson(json["deliveringSite"]),
    deals: List<dynamic>.from(json["deals"].map((x) => x)),
    details: json["details"],
    notes: json["notes"],
    price: json["price"],
    weight: json["weight"],
    containersNumber: json["containersNumber"],
    trucksNumber: json["trucksNumber"],
    truck: json["truck"],
    chatId: json["chatId"],
    loadedAt: DateTime.parse(json["loadedAt"]),
    deliveredAt: DateTime.parse(json["deliveredAt"]),
    loadingAt: DateTime.parse(json["loadingAt"]),
    deliveringAt: DateTime.parse(json["deliveringAt"]),
    truckSubCategory: TruckCategory.fromJson(json["truckSubCategory"]),
    truckCategory: TruckCategory.fromJson(json["truckCategory"]),
  );

}

class IngSite {
  IngSite({
    this.lat,
    this.long,
    this.address,
  });

  double? lat;
  double? long;
  String? address;

  factory IngSite.fromJson(Map<String, dynamic> json) => IngSite(
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    address: json["address"],
  );

}

class OrderImage {
  OrderImage({
    this.id,
    this.path,
  });

  String? id;
  String? path;

  factory OrderImage.fromJson(Map<String, dynamic> json) => OrderImage(
    id: json["id"],
    path: json["path"],
  );

}

class TruckCategory {
  TruckCategory({
    this.id,
    this.name,
    this.nameAr,
    this.nameUr,
    this.image,
  });

  String? id;
  String? name;
  String? nameAr;
  String? nameUr;
  String? image;

  factory TruckCategory.fromJson(Map<String, dynamic> json) => TruckCategory(
    id: json["id"],
    name: json["name"],
    nameAr: json["nameAr"],
    nameUr: json["nameUr"] == null ? null : json["nameUr"],
    image: json["image"],
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
  String? profileImagePath;
  List<dynamic>? userRoles;
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
    profileImagePath: json["profileImagePath"] == null ? null : json["profileImagePath"],
    userRoles: List<dynamic>.from(json["userRoles"].map((x) => x)),
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
  dynamic name;

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
    id: json["id"],
    name: json["name"],
  );

}

class TalkingLanguage {
  TalkingLanguage({
    this.id,
    this.name,
    this.native,
    this.code,
  });

  String? id;
  dynamic name;
  dynamic native;
  dynamic code;

  factory TalkingLanguage.fromJson(Map<String, dynamic> json) => TalkingLanguage(
    id: json["id"],
    name: json["name"],
    native: json["native"],
    code: json["code"],
  );

}
