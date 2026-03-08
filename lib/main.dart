import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database/db_helper.dart';
import 'database/sample_data.dart';
import 'screens/splash_screen.dart';

// 🌙 GLOBAL DARK MODE
ValueNotifier<bool> isDarkMode = ValueNotifier(false);

// ===============================
// THEME FUNCTIONS
// ===============================
Future<void> loadThemePreference() async {
  final prefs = await SharedPreferences.getInstance();
  isDarkMode.value = prefs.getBool('darkMode') ?? false;
}

Future<void> saveThemePreference(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('darkMode', value);
}

// ===============================
// MAIN
// ===============================
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadThemePreference();

  // Initialize DB
  final db = await DBHelper.database;

  // 🔥 INSERT SAMPLE DATA ONLY FIRST TIME
  final prefs = await SharedPreferences.getInstance();
  final isFirstRun = prefs.getBool('isFirstRun') ?? true;

  if (isFirstRun) {
    await SampleData.insertInitialData();
    await prefs.setBool('isFirstRun', false);
  }

  runApp(const BankMateApp());
}

// ===============================
// ROOT APP
// ===============================
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
            useMaterial3: true,
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
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.black,
            cardColor: Colors.grey.shade900,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              centerTitle: true,
            ),
          ),

          themeMode: dark ? ThemeMode.dark : ThemeMode.light,

          home: const SplashScreen(),
        );
      },
    );
  }
}