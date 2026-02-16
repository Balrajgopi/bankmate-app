import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../database/db_helper.dart';
import 'bank_list_screen.dart';
import 'starred_banks_screen.dart';
import 'emi_calculator_screen.dart';
import 'settings_screen.dart';
import '../main.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Map<String, dynamic>>> _future;

  @override
  void initState() {
    super.initState();
    _future = DBHelper.database.then((db) => db.query('category'));
  }

  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> confirmExit() async {
    final exit = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Exit BankMate'),
        content: const Text('Do you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    if (exit == true) {
      SystemNavigator.pop();
    }
  }

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    saveThemePreference(isDarkMode.value);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => confirmExit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bank Categories'),
          leading: IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: confirmExit,
          ),
          actions: [

            IconButton(
              icon: Icon(
                isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
              ),
              onPressed: toggleDarkMode,
            ),

            IconButton(
              icon: const Icon(Icons.calculate),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EmiCalculatorScreen(),
                  ),
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StarredBanksScreen(),
                  ),
                );
              },
            ),

            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Settings') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsScreen(),
                    ),
                  );
                } else if (value == 'Search') {
                  showToast('Search clicked');
                } else if (value == 'Compose Email') {
                  showToast('Compose Email clicked');
                } else if (value == 'Feedback') {
                  showToast('Feedback clicked');
                }
              },
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: 'Settings',
                  child: Text('Settings'),
                ),
                PopupMenuItem(
                  value: 'Search',
                  child: Text('Search'),
                ),
                PopupMenuItem(
                  value: 'Compose Email',
                  child: Text('Compose Email'),
                ),
                PopupMenuItem(
                  value: 'Feedback',
                  child: Text('Feedback'),
                ),
              ],
            ),
          ],
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No categories found'));
            }

            return ListView(
              children: snapshot.data!
                  .map(
                    (c) => Card(
                  child: ListTile(
                    title: Text(c['name']),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BankListScreen(
                            categoryId: c['id'],
                            categoryName: c['name'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
