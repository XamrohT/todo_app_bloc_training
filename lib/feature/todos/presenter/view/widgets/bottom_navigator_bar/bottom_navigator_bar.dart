import 'package:flutter/material.dart';
import 'package:todo_app_bloc/shared/styles/styles.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      currentIndex: _selectedIndex,
      unselectedItemColor: AppColors.inactiveColor,
      selectedItemColor: Colors.blueAccent,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_sharp),
          label: 'Todo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_sharp),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_sharp),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done),
          label: 'Done',
        ),
      ],
    );
  }
}
