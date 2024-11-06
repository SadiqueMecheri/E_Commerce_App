import 'package:flutter/material.dart';
import 'HomePage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  // List of widgets for each page
  final List<Widget> _pages = [
    Homepage(),
    Homepage(),
    Homepage(),
    Homepage(),
    Homepage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,

            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey.shade400,
            selectedFontSize: 14,
            unselectedFontSize: 13,
            // selectedLabelStyle: TextStyle(fontFamily: 'Rubik'),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: 'Swan',
                icon: Image.asset(
                  'assets/icons/swan.png', // Path to your PNG image
                  height: 24, // Set the size as needed
                  width: 24,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Brands',
                icon: Image.asset(
                  'assets/icons/brand.png', // Path to your PNG image
                  height: 24, // Set the size as needed
                  width: 24,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Best Items',
                icon: Image.asset(
                  'assets/icons/bestitems.png', // Path to your PNG image
                  height: 24, // Set the size as needed
                  width: 24,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Categories',
                icon: Image.asset(
                  'assets/icons/category.png', // Path to your PNG image
                  height: 24, // Set the size as needed
                  width: 24,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Account',
                icon: Image.asset(
                  'assets/icons/account.png', // Path to your PNG image
                  height: 24, // Set the size as needed
                  width: 24,
                ),
              ),
            ],
          ),
        ));
  }
}
