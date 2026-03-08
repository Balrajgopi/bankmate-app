import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../database/db_helper.dart';
import '../main.dart';
import 'login_screen.dart';
import 'starred_banks_screen.dart';
import 'feedback_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {

  String userName = "User";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs =
    await SharedPreferences.getInstance();
    setState(() {
      userName =
          prefs.getString('userName') ?? "User";
    });
  }

  // ===============================
  // EMAIL
  // ===============================
  Future<void> composeEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'rupeshghongade33@gmail.com',
      query:
      'subject=BankMate App Feedback',
    );

    await launchUrl(emailUri);
  }

  // ===============================
  // RESET STARRED DATA
  // ===============================
  Future<void> resetStarredData() async {
    final db = await DBHelper.database;

    await db.update(
      'bank',
      {'isBookmarked': 0},
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content:
        Text("Starred banks cleared"),
      ),
    );
  }

  // ===============================
  // LOGOUT
  // ===============================
  Future<void> logout() async {
    final prefs =
    await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('userName');

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const LoginScreen(),
      ),
          (route) => false,
    );
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Logout"),
        content: const Text(
            "Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              logout();
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  void showAboutDialogBox() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("About BankMate"),
        content: const Text(
          "BankMate\n\n"
              "Offline Banking Guide App\n"
              "Version 1.0.0\n\n"
              "Developed for educational purpose.\n"
              "Helps compare banks, calculate EMI,\n"
              "and explore banking information.",
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  void showResetDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title:
        const Text("Reset Starred Banks"),
        content: const Text(
            "This will remove all starred banks.\n\nContinue?"),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              resetStarredData();
            },
            child: const Text("Reset"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Scaffold(
      appBar:
      AppBar(title: const Text("Settings")),
      body: ListView(
        padding:
        const EdgeInsets.all(16),
        children: [

          // ===============================
          // USER PROFILE SECTION
          // ===============================
          Card(
            shape:
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(18),
            ),
            child: ListTile(
              leading:
              const CircleAvatar(
                radius: 28,
                child:
                Icon(Icons.person),
              ),
              title: Text(
                userName,
                style: const TextStyle(
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
              subtitle:
              const Text("Logged In User"),
            ),
          ),

          const SizedBox(height: 20),

          // ===============================
          // DARK MODE
          // ===============================
          ValueListenableBuilder<bool>(
            valueListenable: isDarkMode,
            builder:
                (context, dark, _) {
              return SwitchListTile(
                value: dark,
                title:
                const Text("Dark Mode"),
                onChanged: (value) {
                  isDarkMode.value =
                      value;
                  saveThemePreference(
                      value);
                },
              );
            },
          ),

          const Divider(),

          // ===============================
          // STARRED BANKS
          // ===============================
          ListTile(
            leading:
            const Icon(Icons.star),
            title:
            const Text("Starred Banks"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const StarredBanksScreen(),
                ),
              );
            },
          ),

          // ===============================
          // EMAIL
          // ===============================
          ListTile(
            leading:
            const Icon(Icons.email),
            title:
            const Text("Contact Developer"),
            onTap: composeEmail,
          ),

          // ===============================
          // FEEDBACK
          // ===============================
          ListTile(
            leading:
            const Icon(Icons.feedback),
            title:
            const Text("Feedback"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const FeedbackScreen(),
                ),
              );
            },
          ),

          // ===============================
          // ABOUT
          // ===============================
          ListTile(
            leading:
            const Icon(Icons.info),
            title:
            const Text("About App"),
            onTap: showAboutDialogBox,
          ),

          // ===============================
          // RESET
          // ===============================
          ListTile(
            leading:
            const Icon(Icons.refresh),
            title:
            const Text("Reset Starred Banks"),
            onTap: showResetDialog,
          ),

          const Divider(),

          // ===============================
          // LOGOUT
          // ===============================
          ListTile(
            leading:
            const Icon(Icons.logout),
            title:
            const Text("Logout"),
            onTap: showLogoutDialog,
          ),
        ],
      ),
    );
  }
}