import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../database/db_helper.dart';
import 'bank_list_screen.dart';
import 'starred_banks_screen.dart';
import 'emi_calculator_screen.dart';
import 'settings_screen.dart';
import 'search_screen.dart';
import 'feedback_screen.dart';
import 'nearby_banks_screen.dart';

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

  Future<void> confirmExit() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Exit BankMate'),
        content: const Text('Do you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    if (shouldExit == true) {
      SystemNavigator.pop();
    }
  }

  IconData getCategoryIcon(String name) {
    if (name.contains('Public')) return Icons.account_balance;
    if (name.contains('Government')) return Icons.gavel;
    return Icons.groups;
  }

  Future<void> composeEmail() async {
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
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No email app found on this device"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) confirmExit();
      },
      child: Scaffold(
        body: Column(
          children: [

            // 🔵 PREMIUM APPBAR
            Container(
              padding: const EdgeInsets.only(
                  top: 50, left: 16, right: 16, bottom: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1565C0), Color(0xFF1E88E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [

                  // Exit
                  IconButton(
                    icon: const Icon(Icons.exit_to_app,
                        color: Colors.white),
                    onPressed: confirmExit,
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "BankMate",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),

                  // 📍 Nearby Banks
                  IconButton(
                    icon: const Icon(Icons.location_on,
                        color: Colors.white),
                    tooltip: "Nearby Banks",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const NearbyBanksScreen(),
                        ),
                      );
                    },
                  ),

                  // 🧮 EMI Calculator
                  IconButton(
                    icon: const Icon(Icons.calculate,
                        color: Colors.white),
                    tooltip: "EMI Calculator",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const EmiCalculatorScreen(),
                        ),
                      );
                    },
                  ),

                  // ⭐ Starred
                  IconButton(
                    icon: const Icon(Icons.star,
                        color: Colors.white),
                    tooltip: "Starred Banks",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const StarredBanksScreen(),
                        ),
                      );
                    },
                  ),

                  // ⋮ 3-DOT MENU
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert,
                        color: Colors.white),
                    onSelected: (value) {
                      if (value == 'Settings') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            const SettingsScreen(),
                          ),
                        );
                      } else if (value == 'Search') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            const SearchScreen(),
                          ),
                        );
                      } else if (value == 'Compose Email') {
                        composeEmail();
                      } else if (value == 'Feedback') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            const FeedbackScreen(),
                          ),
                        );
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
            ),

            const SizedBox(height: 20),

            // CATEGORY LIST
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _future,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final category =
                      snapshot.data![index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.grey.shade900
                              : Colors.white,
                          borderRadius:
                          BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withValues(alpha: 0.08),
                              blurRadius: 10,
                              offset:
                              const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 28,
                            backgroundColor:
                            Colors.blue.withValues(
                                alpha: 0.1),
                            child: Icon(
                              getCategoryIcon(
                                  category['name']),
                              size: 28,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text(
                            category['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                              "Explore available banks"),
                          trailing: const Icon(
                              Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    BankListScreen(
                                      categoryId:
                                      category['id'],
                                      categoryName:
                                      category['name'],
                                    ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: const [
                  Divider(),
                  SizedBox(height: 6),
                  Text(
                    "BankMate v1.0",
                    style: TextStyle(
                        fontWeight:
                        FontWeight.bold),
                  ),
                  Text(
                    "Offline Banking Guide",
                    style: TextStyle(
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}