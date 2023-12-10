import 'package:hive/hive.dart';
import 'package:practice/database/Person.dart';

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1; // Unique identifier for the type

  // @override
  // Person read(BinaryReader reader) {
  //   return Person(
  //     name: reader.readString(),
  //     age: reader.readInt(),
  //     friends: List<String>.from(reader.readList()),
  //   );
  // }
  // Read
  @override
  Person read (BinaryReader reader){
    return Person(
        name: reader.readString(),
        age: reader.readInt(),
        friends: List<String>.from(reader.readList()),
    );
  }
  @override

  @override
  void write(BinaryWriter writer, Person obj) {
    writer.writeString(obj.name);
    writer.writeInt(obj.age);
    writer.writeList(obj.friends);
  }
}
