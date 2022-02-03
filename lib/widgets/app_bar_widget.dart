import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.grey.shade800)),
      backgroundColor: Colors.white10,
      elevation: 0,
      foregroundColor: Colors.grey.shade800,
      bottom: PreferredSize(
        child: Container(
          color: Colors.grey.shade200,
          height: 1,
        ),
        preferredSize: const Size.fromHeight(4.0),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
