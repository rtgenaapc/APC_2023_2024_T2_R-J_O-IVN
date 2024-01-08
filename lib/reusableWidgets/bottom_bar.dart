// ignore_for_file: override_on_non_overriding_member, unused_element

import 'package:flutter/material.dart';
import 'package:ruth_and_jerry/constants/global_variable.dart';

abstract class BottomBar extends StatelessWidget {
  static const String routeName = '/actual-homebar';

  const BottomBar({Key? key}) : super(key: key);
}

class _BottomBarState extends State<StatefulWidget> {
  final int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVar.selectedNavBarColor,
        unselectedItemColor: GlobalVar.selectedNavBarColor,
        backgroundColor: const Color.fromARGB(255, 225, 40, 40),
        iconSize: 28,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store), label: 'FreshSelections'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'CustomerOrders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
