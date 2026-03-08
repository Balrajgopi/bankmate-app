import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'bank_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<Map<String, dynamic>> banks = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    fetchBanks();
  }

  Future<void> fetchBanks() async {
    final db = await DBHelper.database;

    final result = searchText.isEmpty
        ? await db.query('bank')
        : await db.query(
      'bank',
      where: 'name LIKE ?',
      whereArgs: ['%$searchText%'],
    );

    setState(() {
      banks = result;
    });
  }

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Banks'),
      ),
      body: Column(
        children: [

          // 🔍 SEARCH FIELD
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search bank by name',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: isDark
                    ? Colors.grey.shade800
                    : Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                searchText = value;
                fetchBanks();
              },
            ),
          ),

          // 📋 RESULT LIST
          Expanded(
            child: banks.isEmpty
                ? const Center(
              child: Text(
                'No banks found',
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),
            )
                : ListView.builder(
              padding:
              const EdgeInsets.symmetric(
                  horizontal: 16),
              itemCount: banks.length,
              itemBuilder:
                  (context, index) {

                final bank =
                banks[index];

                return Card(
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16),
                  ),
                  margin:
                  const EdgeInsets.only(
                      bottom: 14),
                  child: ListTile(
                    leading:
                    const Icon(
                        Icons.account_balance),
                    title: Text(
                      bank['name'],
                      style:
                      const TextStyle(
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                    trailing:
                    const Icon(
                        Icons.arrow_forward_ios,
                        size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              BankDetailScreen(
                                  bank:
                                  bank),
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