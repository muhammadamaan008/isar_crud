import 'package:flutter/material.dart';
import 'package:isar_crud/db/operations.dart';
import 'package:isar_crud/models/person.dart';
import 'package:isar_crud/widgets/custom_person_info_tile.dart';
import 'package:provider/provider.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<Person> allPersons = [];
  List<Person> filteredPersons = [];

  @override
  void initState() {
    super.initState();
    context.read<Operations>().fetchAllPersons();
    
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final watch = context.watch<Operations>();
    allPersons = watch.personsData;
    filteredPersons = allPersons;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: TextField(
                  onChanged: (String enterChar) {
                    List<Person> resultList = [];
                    if (enterChar.isEmpty) {
                      resultList = allPersons;
                    } else {
                    resultList = allPersons
                          .where((element) => element.name
                              .toLowerCase()
                              .contains(enterChar.toLowerCase()))
                          .toList();
                      print('Filtered list length: ${resultList.length}');
                    }
                    setState(() {
                      filteredPersons = resultList;
                    });
                  },
                  decoration: InputDecoration(
                      label: const Text('Search'),
                      labelStyle: const TextStyle(color: Colors.white),
                      suffixIcon: const Icon(Icons.search),
                      suffixIconColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2))),
                ),
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.filter_list),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'newest',
                  child: const Text('Newest'),
                  onTap: () => context.read<Operations>().latestAddedPerson(),
                ),
                PopupMenuItem<String>(
                  value: 'oldest',
                  child: const Text('Oldest'),
                  onTap: () => context.read<Operations>().oldestAddedPerson(),
                ),
              ],
            ),
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.builder(
              itemBuilder: (context, index) {
                final person = filteredPersons[index];
                print(filteredPersons[index].name);
                return PersonInfo(
                    imageUrl: person.imageUrl,
                    name: person.name,
                    age: person.age);
              },
              itemCount: filteredPersons.length),
        ))
      ],
    );
  }
}
