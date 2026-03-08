import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'bank_detail_screen.dart';

class StarredBanksScreen extends StatefulWidget {
  const StarredBanksScreen({super.key});

  @override
  State<StarredBanksScreen> createState() =>
      _StarredBanksScreenState();
}

class _StarredBanksScreenState
    extends State<StarredBanksScreen> {

  List<Map<String, dynamic>> banks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStarredBanks();
  }

  Future<void> fetchStarredBanks() async {
    final db = await DBHelper.database;
    final result = await db.query(
      'bank',
      where: 'isBookmarked = ?',
      whereArgs: [1],
    );

    setState(() {
      banks = result;
      isLoading = false;
    });
  }

  Future<void> toggleStar(int id) async {
    final db = await DBHelper.database;

    await db.update(
      'bank',
      {'isBookmarked': 0},
      where: 'id = ?',
      whereArgs: [id],
    );

    fetchStarredBanks();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Removed from Starred"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Starred Banks"),
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : banks.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_border,
              size: 90,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            const Text(
              "No Starred Banks Yet",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Tap the star icon on any bank\nto add it here.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )
          : RefreshIndicator(
        onRefresh: fetchStarredBanks,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: banks.length,
          itemBuilder: (context, index) {

            final bank = banks[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                  Colors.amber.withOpacity(0.15),
                  child: Text(
                    bank['name'][0],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ),
                title: Text(
                  bank['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle:
                const Text("Tap to view details"),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onPressed: () =>
                      toggleStar(bank['id']),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BankDetailScreen(bank: bank),
                    ),
                  ).then((_) {
                    fetchStarredBanks();
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}