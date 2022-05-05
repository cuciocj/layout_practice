import 'package:flutter/material.dart';
import 'package:layout_practice/screens/food_item.dart';
import 'package:layout_practice/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const LayoutSample());
}

class LayoutSample extends StatelessWidget {
  const LayoutSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Sample',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('This is a Scaffold'),
          ),
          body: const FoodItem(),
          bottomNavigationBar: const BottomNavBar()),
    );
  }
}
