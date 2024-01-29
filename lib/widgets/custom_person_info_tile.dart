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
    return Card(
      color: Colors.grey,
      elevation: 10,
      child: ListTile(
        leading: CircleAvatar(radius: 20,backgroundImage: NetworkImage(imageUrl)),
        title: Text(name, style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        subtitle: Text(age.toString(),style: const TextStyle(color: Color.fromARGB(255, 199, 199, 197)))),
      );
  }
}
