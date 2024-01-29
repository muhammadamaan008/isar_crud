import 'package:flutter/material.dart';
import 'package:isar_crud/database/crud_operations.dart';
import 'package:isar_crud/models/person.dart';
import 'package:isar_crud/utilis/constants.dart';
import 'package:isar_crud/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatelessWidget {
  final bool adBtnPressed;
  const CustomDialog({super.key, required this.adBtnPressed});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final imageUrlController = TextEditingController();
    return AlertDialog(
      backgroundColor: const Color(0xFFD3D3D3),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            labelText: 'Name',
            onTextController: nameController,
          ),
          Visibility(
            visible: adBtnPressed,
            child: CustomTextField(
              labelText: 'Age',
              onTextController: ageController,
            ),
          ),
          Visibility(
            visible: adBtnPressed,
            child: CustomTextField(
              labelText: 'ImageUrl',
              onTextController: imageUrlController,
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                if (imageUrlController.text.isEmpty && adBtnPressed) {
                  context.read<Operations>().addPerson(Person(
                      name: nameController.text,
                      age: int.parse(ageController.text),
                      imageUrl: defaultUrl,
                      timeStamp: DateTime.now().microsecondsSinceEpoch));
                } else if (imageUrlController.text.isNotEmpty && adBtnPressed) {
                  context.read<Operations>().addPerson(Person(
                      name: nameController.text,
                      age: int.parse(ageController.text),
                      imageUrl: defaultUrl,
                      timeStamp: DateTime.now().microsecondsSinceEpoch));
                } else if (adBtnPressed == false) {
                  context
                      .read<Operations>()
                      .deletePersonByName(nameController.text);
                }
                Navigator.pop(context);
              },
              child: adBtnPressed
                  ? const Text(
                      'ADD',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  : const Text('DELETE',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
