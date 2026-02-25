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
      banks = result;
    });
  }

  void toggleStar(int id) async {
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

      body: banks.isEmpty
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
              "Tap the star icon on any bank\n"
                  "to add it here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding:
        const EdgeInsets.symmetric(
            horizontal: 16, vertical: 20),
        itemCount: banks.length,
        itemBuilder: (context, index) {

          final bank = banks[index];

          return Container(
            margin:
            const EdgeInsets.only(bottom: 18),
            padding:
            const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.grey.shade900
                  : Colors.white,
              borderRadius:
              BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(alpha: 0.07),
                  blurRadius: 12,
                  offset:
                  const Offset(0, 6),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
              EdgeInsets.zero,

              leading: CircleAvatar(
                radius: 28,
                backgroundColor:
                Colors.amber.withValues(
                    alpha: 0.15),
                child: Text(
                  bank['name'][0],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ),

              title: Text(
                bank['name'],
                style: const TextStyle(
                  fontWeight:
                  FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              subtitle:
              Text(bank['contact']),

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
                        BankDetailScreen(
                            bank: bank),
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