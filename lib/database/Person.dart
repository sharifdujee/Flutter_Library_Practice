
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:practice/database/personadapter.dart';

@HiveType(typeId: 1)
class Person{
  Person({required this.name, required this.age, required this.friends});

  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  List<String> friends;
}

void check() async {
  var path = Directory.current.path;
  Hive
  ..init(path)
  ..registerAdapter(PersonAdapter());

  var box = await Hive.openBox('testBox');
  var person = Person
    (
    name:'Rahat',
  age: 25,
  friends: ['Amit', 'Arafat', 'Fahid'],
  );
  await box.put('personal', person);
  await box.get('name');

}


