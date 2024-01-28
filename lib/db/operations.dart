import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_crud/models/person.dart';
import 'package:path_provider/path_provider.dart';

class Operations extends ChangeNotifier {
  static late Isar isar;

  static Future<void> connectDb() async {
    final dir = await getApplicationDocumentsDirectory();
    isar =
        await Isar.open([PersonSchema], directory: dir.path, inspector: true);
  }

  List<Person> personsData = [];

  Future<void> addPerson(Person person) async {
    await isar.writeTxn(() => isar.persons.put(person));
    fetchAllPersons();
  }

  Future<void> fetchAllPersons() async {
    List<Person> fetchPersons = await isar.persons.where().findAll();
    personsData.clear();
    personsData.addAll(fetchPersons);
    notifyListeners();
  }

  Future<void> updatePerson(int id, Person updatedPerson) async {
    Person? existingPerson = await isar.persons.get(id);
    if (existingPerson != null) {
      await isar.writeTxn(() => isar.persons.put(updatedPerson));
      fetchAllPersons();
    }
  }

  Future<void> deletePersonByName(String name) async {
    await isar.writeTxn(() async {
      await isar.persons.where().filter().nameEqualTo(name).deleteAll();
      fetchAllPersons();
    });
  }

  Future<void> deletePerson(int id) async {
    await isar.persons.delete(id);
    fetchAllPersons();
  }

  Future<void> latestAddedPerson() async {
    personsData.clear();
    personsData = await isar.persons.where().sortByTimeStamp().findAll();
    notifyListeners();
  }

  Future<void> oldestAddedPerson() async {
    personsData.clear();
    personsData = await isar.persons.where().sortByTimeStampDesc().findAll();
    notifyListeners();
  }
}
