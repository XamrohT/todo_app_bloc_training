import 'package:flutter/material.dart';

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: const Icon(Icons.check_sharp, color: Colors.white),
            ),
          ),
          const Text('Taski'),
          const SizedBox(width: 170),
          const Text('John'),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child:  CircleAvatar(
              radius: 20,
              backgroundImage:  AssetImage('assets/images/avatar-icon.jpg'),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
