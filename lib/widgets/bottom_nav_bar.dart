import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.send),
          label: 'send',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'search',
        ),
      ],
    );
  }
}
