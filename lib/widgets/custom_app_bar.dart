import 'package:flutter/material.dart';
import 'package:isar_crud/widgets/custom_alert_dialog.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: const Text('ISAR',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 5)),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          iconSize: 30,
          color: Colors.red,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const CustomDialog(adBtnPressed: false));
          },
        )
      ],
    );
  }
}
