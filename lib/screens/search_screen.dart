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

  void fetchBanks() async {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Banks'),
      ),
      body: Column(
        children: [

          // 🔍 SEARCH FIELD
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search bank by name',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
                ? const Center(child: Text('No banks found'))
                : ListView.builder(
              itemCount: banks.length,
              itemBuilder: (context, index) {
                final bank = banks[index];

                return Card(
                  child: ListTile(
                    title: Text(bank['name']),
                    subtitle: Text(bank['contact']),
                    trailing: const Icon(Icons.arrow_forward_ios),
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