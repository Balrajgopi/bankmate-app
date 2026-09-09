import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../database/db_helper.dart';
import 'bank_list_screen.dart';
import 'profile_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  late Future<List<Map<String, dynamic>>> _future;

  String userName = "User";
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _future = DBHelper.database.then((db) => db.query('category'));
    loadUser();
  }

  Future<void> loadUser() async {

    final db = await DBHelper.database;

    final result = await db.query('users');

    if (result.isNotEmpty) {

      final user = result.first;

      setState(() {
        userName = user['name']?.toString() ?? "User";
        imagePath = user['image']?.toString();
      });
    }
  }

  IconData getCategoryIcon(String name) {
    if (name.contains('Public')) return Icons.account_balance;
    if (name.contains('Government')) return Icons.gavel;
    return Icons.groups;
  }

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

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(

      backgroundColor:
      isDark ? Colors.black : const Color(0xffF4F6FA),

      body: SafeArea(

        child: Column(

          children: [

            /// HEADER
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 18),

              decoration: const BoxDecoration(

                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1565C0),
                    Color(0xFF1E88E5)
                  ],
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
              ),

              child: Row(

                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  /// EXIT
                  IconButton(
                    icon: const Icon(Icons.exit_to_app,
                        color: Colors.white),
                    onPressed: showExitDialog,
                  ),

                  /// TITLE
                  const Text(
                    "BankMate",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  /// PROFILE
                  GestureDetector(

                    onTap: () async {

                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const ProfileScreen(),
                        ),
                      );

                      loadUser();
                    },

                    child: CircleAvatar(

                      radius: 20,

                      backgroundColor: Colors.white,

                      backgroundImage:
                      imagePath != null
                          ? FileImage(File(imagePath!))
                          : null,

                      child: imagePath == null
                          ? Text(
                        userName.isNotEmpty
                            ? userName[0]
                            .toUpperCase()
                            : "U",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      )
                          : null,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// CATEGORY LIST
            Expanded(

              child: FutureBuilder(

                future: _future,

                builder: (context, snapshot) {

                  if (!snapshot.hasData) {

                    return const Center(
                        child:
                        CircularProgressIndicator());
                  }

                  final categories =
                  snapshot.data
                  as List<Map<String, dynamic>>;

                  return ListView.separated(

                    padding: const EdgeInsets.all(16),

                    itemCount: categories.length,

                    separatorBuilder: (_, __) =>
                    const SizedBox(height: 16),

                    itemBuilder: (context, index) {

                      final category =
                      categories[index];

                      return GestureDetector(

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

                        child: Container(

                          height: 160, /// ⭐ increased height

                          decoration: BoxDecoration(

                            color: isDark
                                ? Colors.grey.shade900
                                : Colors.white,

                            borderRadius:
                            BorderRadius.circular(20),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withValues(
                                    alpha: 0.08),
                                blurRadius: 12,
                                offset:
                                const Offset(0, 6),
                              ),
                            ],
                          ),

                          padding:
                          const EdgeInsets.symmetric(
                              horizontal: 18),

                          child: Row(

                            children: [

                              /// ICON
                              Container(
                                height: 55,
                                width: 55,

                                decoration:
                                BoxDecoration(
                                  color: Colors.blue
                                      .withValues(
                                      alpha:
                                      0.1),
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      14),
                                ),

                                child: Icon(
                                  getCategoryIcon(
                                      category[
                                      'name']),
                                  color:
                                  Colors.blue,
                                  size: 28,
                                ),
                              ),

                              const SizedBox(width: 18),

                              /// TITLE
                              Expanded(
                                child: Text(
                                  category['name'],
                                  style:
                                  const TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                    FontWeight
                                        .w600,
                                  ),
                                ),
                              ),

                              /// ARROW
                              const Icon(
                                Icons
                                    .arrow_forward_ios,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ],
                          ),
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