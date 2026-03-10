import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'bank_detail_screen.dart';

class BankListScreen extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const BankListScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<BankListScreen> createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {

  List<Map<String, dynamic>> banks = [];
  List<Map<String, dynamic>> filteredBanks = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBanks();
  }

  Future<void> loadBanks() async {

    final db = await DBHelper.database;

    final result = await db.query(
      'bank',
      where: 'categoryId = ?',
      whereArgs: [widget.categoryId],
    );

    setState(() {
      banks = result;
      filteredBanks = result;
      isLoading = false;
    });
  }

  void searchBank(String query) {

    setState(() {
      filteredBanks = banks
          .where((bank) =>
          bank['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> toggleBookmark(int bankId, int currentValue) async {

    final db = await DBHelper.database;

    await db.update(
      'bank',
      {'isBookmarked': currentValue == 1 ? 0 : 1},
      where: 'id = ?',
      whereArgs: [bankId],
    );

    loadBanks();
  }

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [

          // ===== SEARCH BAR =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: searchBank,
              decoration: InputDecoration(
                hintText: "Search bank...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor:
                isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // ===== BANK LIST =====
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredBanks.length,
              itemBuilder: (context, index) {

                final bank = filteredBanks[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.grey.shade900
                        : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: ListTile(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      child: const Icon(
                        Icons.account_balance,
                        color: Colors.blue,
                      ),
                    ),

                    title: Text(
                      bank['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: const Text("Tap to view details"),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        // ⭐ STAR BUTTON
                        IconButton(
                          icon: Icon(
                            bank['isBookmarked'] == 1
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.orange,
                          ),
                          onPressed: () {
                            toggleBookmark(
                                bank['id'],
                                bank['isBookmarked']);
                          },
                        ),

                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),

                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              BankDetailScreen(bank: bank),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}