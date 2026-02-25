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

  List<Map<String, dynamic>> allBanks = [];
  List<Map<String, dynamic>> filteredBanks = [];

  @override
  void initState() {
    super.initState();
    fetchBanks();
  }

  Future<void> fetchBanks() async {
    final db = await DBHelper.database;

    final result = await db.query(
      'bank',
      where: 'categoryId = ?',
      whereArgs: [widget.categoryId],
    );

    setState(() {
      allBanks = result;
      filteredBanks = result;
    });
  }

  void searchBank(String query) {
    final results = allBanks.where((bank) {
      final name = bank['name'] ?? '';
      return name.toString().toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredBanks = results;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),

      body: Column(
        children: [

          // 🔍 SEARCH BAR
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                ),
              ],
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search bank...",
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              onChanged: searchBank,
            ),
          ),

          // 📋 BANK LIST
          Expanded(
            child: filteredBanks.isEmpty
                ? const Center(
              child: Text(
                "No banks found",
                style: TextStyle(fontSize: 16),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredBanks.length,
              itemBuilder: (context, index) {

                final bank = filteredBanks[index];
                final bankName = bank['name']?.toString() ?? "Unknown Bank";

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.blue.withValues(alpha: 0.1),
                      child: const Icon(
                        Icons.account_balance,
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                    title: Text(
                      bankName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text("Tap to view details"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BankDetailScreen(bank: bank),
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