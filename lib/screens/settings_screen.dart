import 'package:flutter/material.dart';
import '../main.dart';
import '../database/db_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // 🔄 CLEAR ALL STARRED BANKS
  Future<void> clearStarredBanks() async {
    final db = await DBHelper.database;
    await db.update(
      'bank',
      {'isBookmarked': 0},
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All starred banks cleared')),
    );
  }

  void showAboutDialogBox() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('About BankMate'),
        content: const Text(
          'BankMate is an offline banking guide app.\n\n'
              'Features:\n'
              '• Bank Categories\n'
              '• Compare Banks\n'
              '• Starred Banks\n'
              '• EMI Calculator\n'
              '• Dark Mode\n\n'
              'Version: 1.0.0',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
    saveThemePreference(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [

          // 🌙 DARK MODE SWITCH
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable or disable dark theme'),
            value: isDarkMode.value,
            onChanged: toggleDarkMode,
          ),

          const Divider(),

          // 🗑 RESET STARRED BANKS
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: const Text('Clear Starred Banks'),
            subtitle: const Text('Remove all starred banks'),
            onTap: clearStarredBanks,
          ),

          const Divider(),

          // ℹ ABOUT
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            subtitle: const Text('App information'),
            onTap: showAboutDialogBox,
          ),

          const Divider(),

          // 📦 VERSION
          const ListTile(
            leading: Icon(Icons.system_update),
            title: Text('App Version'),
            subtitle: Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}
