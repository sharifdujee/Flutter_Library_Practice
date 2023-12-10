import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:practice/database/personadapter.dart';

@HiveType(typeId:1)
class Person{
  Person({required this.name, required this.age, required this.skills});
  @HiveField(0)
 late  String name;
  @HiveField(1)
   late int age;
  @HiveField(2)
  late List<String> skills;
  @override
  String toString(){
    return '$name: $age';
  }


  void main () async {
    var path = Directory.current.path;
    Hive
    ..init(path)
    ..registerAdapter(PersonAdapter());

    var box = await Hive.openBox('testBox');
    var person = Person(
      name: 'Dave',
      age: 22,
      skills: ['Java', 'Spring Boot', 'Flutter'],

    );
    box.add(person);
    person.age= 30;
    print(box.getAt(0));
    await box.put('dave', person);
    print (box.get('dave'));

  }


}
