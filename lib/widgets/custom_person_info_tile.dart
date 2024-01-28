import 'package:flutter/material.dart';

class PersonInfo extends StatelessWidget {
  final String imageUrl, name;
  final int age;
  const PersonInfo(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(image: NetworkImage(imageUrl))),
      title: Text(name),
      subtitle: Text(age.toString()),
    );
  }
}
