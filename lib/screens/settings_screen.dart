import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import 'search_screen.dart';
import 'feedback_screen.dart';
import '../database/db_helper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // 🔹 Compose Email
  Future<void> composeEmail(BuildContext context) async {
    final Uri emailUri = Uri.parse(
      "mailto:rupeshghongade33@gmail.com"
          "?subject=Feedback for BankMate App"
          "&body=Hello,%0A%0AI would like to share feedback:%0A",
    );

    try {
      await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No email app found"),
        ),
      );
    }
  }

  // 🔹 About Dialog
  void showAboutDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("About BankMate"),
        content: const Text(
          "BankMate is a student banking guide app.\n\n"
              "Features:\n"
              "• Bank Categories\n"
              "• EMI Calculator\n"
              "• Starred Banks\n"
              "• Nearby Banks (GPS)\n"
              "• Dark Mode\n\n"
              "Version: 1.0.0",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // 🔹 Clear All Starred Banks
  Future<void> clearStarredBanks(BuildContext context) async {
    final db = await DBHelper.database;

    await db.update(
      'bank',
      {'isBookmarked': 0},
      where: 'isBookmarked = ?',
      whereArgs: [1],
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All starred banks cleared successfully"),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget settingsCard(BuildContext context, Widget child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            // 🔹 Appearance
            sectionTitle("Appearance"),

            settingsCard(
              context,
              ValueListenableBuilder<bool>(
                valueListenable: isDarkMode,
                builder: (context, dark, _) {
                  return SwitchListTile(
                    value: dark,
                    title: const Text("Dark Mode"),
                    subtitle: const Text("Enable dark theme"),
                    secondary: const Icon(Icons.dark_mode),
                    onChanged: (value) {
                      isDarkMode.value = value;
                      saveThemePreference(value);
                    },
                  );
                },
              ),
            ),

            // 🔹 Features
            sectionTitle("Features"),

            settingsCard(
              context,
              Column(
                children: [

                  ListTile(
                    leading: const Icon(Icons.search),
                    title: const Text("Search"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SearchScreen(),
                        ),
                      );
                    },
                  ),

                  const Divider(),

                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text("Compose Email"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => composeEmail(context),
                  ),

                  const Divider(),

                  ListTile(
                    leading: const Icon(Icons.feedback_outlined),
                    title: const Text("Feedback"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FeedbackScreen(),
                        ),
                      );
                    },
                  ),

                  const Divider(),

                  ListTile(
                    leading: const Icon(Icons.delete_outline),
                    title: const Text("Clear Starred Banks"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Clear Starred Banks"),
                          content: const Text(
                            "Are you sure you want to remove all starred banks?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                await clearStarredBanks(context);
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // 🔹 General
            sectionTitle("General"),

            settingsCard(
              context,
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text("About App"),
                trailing:
                const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () =>
                    showAboutDialogBox(context),
              ),
            ),

            // 🔹 App Info
            sectionTitle("App Info"),

            settingsCard(
              context,
              const ListTile(
                leading: Icon(Icons.verified),
                title: Text("Version"),
                subtitle: Text("1.0.0"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}