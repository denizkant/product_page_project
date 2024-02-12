import 'package:flutter/material.dart';
import 'package:products_page_project/ui/screen_account.dart';
import 'package:products_page_project/ui/screen_favorite.dart';
import 'package:products_page_project/ui/screen_home.dart';
import 'package:products_page_project/ui/screen_shopping_bag.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
    final List<Widget> _pages = [
    const MyHomePage(title: ''),
    const ShoppingBagPage(),
    const FavoritePage(),
    const AccountPage(),
  ];
    int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Colors.blueGrey,
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home'),
          NavigationDestination(
              selectedIcon: Icon(Icons.shopping_bag),
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Shopping Bag'),
          NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorite'),
          NavigationDestination(
              selectedIcon: Icon(Icons.person_2),
              icon: Icon(Icons.person_2_outlined),
              label: 'Account')
        ],
      ),
      body:_pages[_selectedIndex] ,
    );
  }
}