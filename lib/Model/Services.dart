import 'package:hive/hive.dart';
import 'package:practice/Model/User.dart';
import 'package:practice/Model/box.dart';


class HiveService {
  static Box userBox = Boxes.getTask();

  // To add User To hive
  static addUserToHive(UserModel user) async {
    // await userBox.add(user);
    await userBox.add(user);
  }

  // To delete User from hive
  static deleteUserFromHive(UserModel user) async {
    var key = user.key;
    // await userBox.delete(key);
    await userBox.delete(key);
  }

  // To update data in hive

  // update User's name
  static updateUserName(UserModel user, String name) async {
    user.name = name;
    await user.save();

  }


  // update User's age
  static updateUserAge(UserModel user, int age) async {
    user.age = age;
    await user.save();
  }

  // update User's hobbies
  static updateUserHobbies(UserModel user, List newHobbies) async {
    user.hobbies = newHobbies;
    await user.save();
  }
}