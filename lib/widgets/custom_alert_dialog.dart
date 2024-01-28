import 'package:flutter/material.dart';
import 'package:isar_crud/db/operations.dart';
import 'package:isar_crud/models/person.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatelessWidget {
  final bool adBtn;
  const CustomDialog({super.key, required this.adBtn});

  @override
  Widget build(BuildContext context) {
    late String name;
    late int age;
    late String imageUrl;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              name = value;
            },
          ),
          Visibility(
            visible: adBtn,
            child: TextField(
              onChanged: (value) {
                age = int.parse(value);
              },
            ),
          ),
          Visibility(
            visible: adBtn,
            child: TextField(
              onChanged: (value) {
                imageUrl = value;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                adBtn
                    ? context.read<Operations>().addPerson(Person(
                        name: name,
                        age: age,
                        imageUrl: imageUrl,
                        timeStamp: DateTime.now().microsecondsSinceEpoch))
                    : context.read<Operations>().deletePersonByName(name);
                Navigator.pop(context);
              },
              child: adBtn ? const Text('ADD') : const Text('DELETE'))
        ],
      ),
    );
  }
}
