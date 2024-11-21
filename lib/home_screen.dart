import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/product_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages=const [ProductPage(),CartPage()];
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            selectedPage=value;
          });
        },
        currentIndex: selectedPage,
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '',
          ),
      ]),
    );
  }
}
