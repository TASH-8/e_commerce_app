import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:e_commerce_app/features/home/presentation/pages/homepage.dart';
import 'package:e_commerce_app/features/more/presentation/pages/more_screen.dart';
import 'package:e_commerce_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:e_commerce_app/features/search/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Define the screens for each tab
  final List<Widget> _pages = [
    const HomePage(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.greyshade100,
      body: _pages[
          _currentIndex], // Use the current index to switch between pages.
      bottomNavigationBar: buildBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index on tap.
          });
        },
      ),
    );
  }
}

// Function to build the BottomNavigationBar
Widget buildBottomNavigationBar({
  required int currentIndex,
  required ValueChanged<int> onTap,
}) {
  return BottomNavigationBar(
    backgroundColor: ColorManger.white,
    currentIndex: currentIndex,
    onTap: onTap,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.redAccent,
    unselectedItemColor: Colors.grey,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz),
        label: 'More',
      ),
    ],
  );
}
