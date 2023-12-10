
import 'dart:convert';

import 'package:hive/hive.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  UserModel({
    this.name,
    this.age,
    this.hobbies,
  });
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? age;
  @HiveField(2)
  List<dynamic>? hobbies;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    age: json["age"],
    hobbies: List<dynamic>.from(json["hobbies"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "hobbies": List<dynamic>.from(hobbies!.map((x) => x)),
  };
}