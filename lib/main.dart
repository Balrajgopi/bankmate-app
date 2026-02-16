import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database/db_helper.dart';
import 'database/sample_data.dart';
import 'screens/category_screen.dart';

// 🌙 GLOBAL DARK MODE NOTIFIER
ValueNotifier<bool> isDarkMode = ValueNotifier(false);

Future<void> loadThemePreference() async {
  final prefs = await SharedPreferences.getInstance();
  isDarkMode.value = prefs.getBool('darkMode') ?? false;
}

Future<void> saveThemePreference(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('darkMode', value);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ LOAD SAVED THEME FIRST
  await loadThemePreference();

  await DBHelper.database;
  await SampleData.insertInitialData();

  runApp(const BankMateApp());
}

class BankMateApp extends StatelessWidget {
  const BankMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (_, dark, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BankMate',

          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.grey.shade100,
            cardColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              centerTitle: true,
            ),
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            cardColor: Colors.grey.shade900,
            dividerColor: Colors.white24,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              centerTitle: true,
            ),
          ),

          themeMode: dark ? ThemeMode.dark : ThemeMode.light,
          home: const ExitWrapper(),
        );
      },
    );
  }
}

class ExitWrapper extends StatelessWidget {
  const ExitWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Exit BankMate'),
            content: const Text('Do you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: const CategoryScreen(),
    );
  }
}
