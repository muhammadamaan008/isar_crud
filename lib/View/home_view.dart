import 'package:flutter/material.dart';
import 'package:isar_crud/View/home_view_model.dart';
import 'package:isar_crud/widgets/custom_person_info_tile.dart';
import 'package:provider/provider.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  late Operations viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<Operations>(context, listen: false);
    viewModel.fetchAllPersons();
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
                    viewModel.searchPerson(enterChar);
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      label: const Text('Search'),
                      labelStyle: const TextStyle(color: Colors.black),
                      suffixIcon: const Icon(Icons.search),
                      suffixIconColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2))),
                ),
              ),
            ),
            PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              color: Colors.white,
              elevation: 5,
              icon: const Icon(Icons.filter_list),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'newest',
                  child: const Text(
                    'Newest',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => viewModel.latestAddedPerson(),
                ),
                PopupMenuItem<String>(
                  value: 'oldest',
                  child: const Text('Oldest',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  onTap: () => viewModel.oldestAddedPerson(),
                ),
              ],
            ),
          ],
        ),
        Consumer<Operations>(
          builder: (context, operations, child) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final person = operations.filteredPersons[index];
                    return PersonInfo(
                      imageUrl: person.imageUrl,
                      name: person.name,
                      age: person.age,
                    );
                  },
                  itemCount: operations.filteredPersons.length,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
