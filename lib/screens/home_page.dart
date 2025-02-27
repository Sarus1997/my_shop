// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:my_shop/components/custom_app_bar.dart';
import 'package:my_shop/components/custom_bottom_nav.dart';
import 'package:my_shop/screens/home/home_content.dart';
import 'package:my_shop/screens/category/category_screen.dart';
import 'package:my_shop/screens/cart/cart_screen.dart';
import 'package:my_shop/screens/user/user_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CategoryScreen(someArgument),
    CartContent(),
    UserContent(),
  ];

  static get someArgument => null;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}
