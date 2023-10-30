import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/color.dart';

class Customapp extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  Customapp({required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: gray),
      ),
      leading: BackButton(
        color: blackcolor,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
    );
  }
}
