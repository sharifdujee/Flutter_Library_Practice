
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:practice/Model/Users.dart';

class HiveData{
  static init() async{
    final appDocDir = Directory.current.path;
    Hive.init(appDocDir);

    Hive.registerAdapter(UserModel(
      name: "",
      age: 12,
      hobbies: ['', '']
    ) as TypeAdapter);

    await Hive.openBox('user');


  }

}