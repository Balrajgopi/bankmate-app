import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'starred_banks_screen.dart';
import 'emi_calculator_screen.dart';
import 'nearby_banks_screen.dart';
import 'settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {

  int currentIndex = 0;

  final List<Widget> screens = const [
    CategoryScreen(),
    StarredBanksScreen(),
    EmiCalculatorScreen(),
    NearbyBanksScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:
              Colors.black.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: isDark
              ? Colors.black
              : Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Starred",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "EMI",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: "Nearby",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}