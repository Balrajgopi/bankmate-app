import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'bank_detail_screen.dart';

class StarredBanksScreen extends StatefulWidget {
  const StarredBanksScreen({super.key});

  @override
  State<StarredBanksScreen> createState() => _StarredBanksScreenState();
}

class _StarredBanksScreenState extends State<StarredBanksScreen> {
  List<Map<String, dynamic>> starredBanks = [];

  @override
  void initState() {
    super.initState();
    fetchStarredBanks();
  }

  void fetchStarredBanks() async {
    final db = await DBHelper.database;

    final result = await db.query(
      'bank',
      where: 'isBookmarked = ?',
      whereArgs: [1],
    );

    setState(() {
      starredBanks = result;
    });
  }

  // ⭐ REMOVE STAR
  void unstarBank(int bankId) async {
    final db = await DBHelper.database;

    await db.update(
      'bank',
      {'isBookmarked': 0},
      where: 'id = ?',
      whereArgs: [bankId],
    );

    fetchStarredBanks(); // refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starred Banks'),
      ),
      body: starredBanks.isEmpty
          ? const Center(child: Text('No starred banks'))
          : ListView.builder(
        itemCount: starredBanks.length,
        itemBuilder: (context, index) {
          final bank = starredBanks[index];

          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(
                bank['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(bank['contact']),

              // ⭐ SINGLE STAR (UNSTAR ACTION)
              trailing: IconButton(
                icon: const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                tooltip: 'Remove from starred',
                onPressed: () {
                  unstarBank(bank['id']);
                },
              ),

              // Open bank details
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
    );
  }
}
