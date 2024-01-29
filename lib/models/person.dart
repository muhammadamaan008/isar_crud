import 'package:isar/isar.dart';


part 'person.g.dart';

@Collection()
class Person {
  Id id = Isar.autoIncrement;
  late String name;
  late int age;
  late String imageUrl;
  late int timeStamp;

  Person({required this.name, required this.age,required this.imageUrl, required this.timeStamp});
}
