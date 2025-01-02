import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/appbar_builder.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_row.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_items_row.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_latest_section.dart';
import 'package:flutter/material.dart';

class HomescreenTest extends StatefulWidget {
  const HomescreenTest({super.key});

  @override
  State<HomescreenTest> createState() => _HomescreenTestState();
}

class _HomescreenTestState extends State<HomescreenTest> {
  int _currentIndex = 0;

  // Define the screens for each tab
  final List<Widget> _pages = [
    const HomePageTest(),
    const Center(child: Text('Search Page')),
    const Center(child: Text('Cart Page')),
    const Center(child: Text('Profile Page')),
    const Center(child: Text('More Options Page')),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold( 
      backgroundColor: ColorManger.greyshade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: buildAppBar(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          backgroundColor: Colors.grey.shade100,
        ),
      ),
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

class HomePageTest extends StatelessWidget {
  const HomePageTest({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                Constants.CATEGORIES,
                maxLines: 1,
                style: TextStyles.font35CustomGreyBold,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const CategoriesRow(),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              AutoSizeText(
                Constants.LATEST,
                maxLines: 1,
                style: TextStyles.font35CustomGreyBold,
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              const CustomLatestSection(),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              const CustomItemsRow()
            ],
          ),
        ),
      ) ;
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
