import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/db_helper.dart';
import 'bank_list_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  late Future<List<Map<String, dynamic>>> _future;
  String userName = "User";

  @override
  void initState() {
    super.initState();
    _future = DBHelper.database.then((db) => db.query('category'));
    loadUserName();
  }

  Future<void> loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "User";
    });
  }

  IconData getCategoryIcon(String name) {
    if (name.contains('Public')) return Icons.account_balance;
    if (name.contains('Government')) return Icons.gavel;
    return Icons.groups;
  }

  // ===============================
  // EXIT CONFIRMATION
  // ===============================
  void showExitDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Exit BankMate"),
        content: const Text("Do you want to exit the app?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("No"),
          ),
          ElevatedButton(
            onPressed: () => SystemNavigator.pop(),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.grey.shade100,

      body: SafeArea(
        child: Column(
          children: [

            // ===============================
            // 🔵 CUSTOM APP BAR
            // ===============================
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1565C0), Color(0xFF1E88E5)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // 🔴 EXIT ICON (LEFT)
                  IconButton(
                    icon: const Icon(Icons.exit_to_app, color: Colors.white),
                    onPressed: showExitDialog,
                  ),

                  // 🏦 CENTER TITLE
                  const Text(
                    "BankMate",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // 👤 PROFILE ICON (RIGHT)
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Text(
                      userName.isNotEmpty
                          ? userName[0].toUpperCase()
                          : "U",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===============================
            // CATEGORY LIST
            // ===============================
            Expanded(
              child: FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  final categories =
                  snapshot.data as List<Map<String, dynamic>>;

                  return ListView.builder(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {

                      final category = categories[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 18),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.grey.shade900
                              : Colors.white,
                          borderRadius:
                          BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.08),
                              blurRadius: 10,
                              offset:
                              const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding:
                          const EdgeInsets.all(16),
                          leading: CircleAvatar(
                            radius: 26,
                            backgroundColor:
                            Colors.blue
                                .withOpacity(0.1),
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
          ],
        ),
      ),
    );
  }
}