import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFB100),
      title: const Text('ISAR CRUD',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          iconSize: 30,
          color: Colors.red,
          onPressed: () {},
        )
      ],
    );
  }
}
