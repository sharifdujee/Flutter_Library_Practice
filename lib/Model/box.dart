import 'package:hive/hive.dart';
import 'package:practice/Model/User.dart';


class Boxes {
  static Box<UserModel> getTask() => Hive.box<UserModel>("user");

// Futher,  you can add any other boxes here ...
}