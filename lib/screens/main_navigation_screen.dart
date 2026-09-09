import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'starred_banks_screen.dart';
import 'emi_calculator_screen.dart';
import 'settings_screen.dart';
import 'bank_compare_selector_screen.dart';

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
    BankCompareSelectorScreen(),
    EmiCalculatorScreen(),
    SettingsScreen(),
  ];

  Future<bool> onBackPressed() async {

    /// IF NOT HOME SCREEN -> GO TO HOME
    if (currentIndex != 0) {
      setState(() {
        currentIndex = 0;
      });
      return false;
    }

    /// IF HOME SCREEN -> EXIT CONFIRMATION
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit BankMate"),
        content: const Text("Do you want to exit the app?"),
        actions: [
          TextButton(
            child: const Text("No"),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(
            child: const Text("Yes"),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return WillPopScope(

      onWillPop: onBackPressed,

      child: Scaffold(

        body: screens[currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor:
          isDark ? Colors.black : Colors.white,
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
              icon: Icon(Icons.compare_arrows),
              label: "Compare",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "EMI",
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