import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
    required this.name,
    required this.age,
    required this.hobbies,

  });

  String name;
  int age;
  List<dynamic> hobbies;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
          name: json["name"],
          age: json['age'],
          hobbies: List<dynamic>.from(["hobbies"].map((e) => e))
      );

  get key => null;

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "age": age,
        "hobbies": List<dynamic>.from(hobbies.map((e) => e))
      };

  save() {}


}



//



