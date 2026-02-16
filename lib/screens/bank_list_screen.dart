import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'bank_detail_screen.dart';
import 'bank_comparison_screen.dart';

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
  Set<int> selectedBankIds = {};
  bool compareMode = false;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    fetchBanks();
  }

  void fetchBanks() async {
    final db = await DBHelper.database;

    final result = searchText.isEmpty
        ? await db.query(
      'bank',
      where: 'categoryId = ?',
      whereArgs: [widget.categoryId],
    )
        : await db.query(
      'bank',
      where: 'categoryId = ? AND name LIKE ?',
      whereArgs: [widget.categoryId, '%$searchText%'],
    );

    setState(() {
      banks = result;
    });
  }

  void toggleStar(int id, int current) async {
    final db = await DBHelper.database;

    await db.update(
      'bank',
      {'isBookmarked': current == 1 ? 0 : 1},
      where: 'id = ?',
      whereArgs: [id],
    );

    fetchBanks();
  }

  void toggleCompareSelection(int bankId) {
    setState(() {
      if (selectedBankIds.contains(bankId)) {
        selectedBankIds.remove(bankId);
      } else {
        if (selectedBankIds.length < 2) {
          selectedBankIds.add(bankId);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You can compare only 2 banks'),
            ),
          );
        }
      }
    });
  }

  void resetComparison() {
    setState(() {
      selectedBankIds.clear();
      compareMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 🌙 CHECK DARK MODE
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // 🎨 THEME COLORS
    final Color cardColor =
    isDark ? Colors.grey.shade900 : Colors.white;
    final Color textColor =
    isDark ? Colors.white : Colors.black;
    final Color subTextColor =
    isDark ? Colors.white70 : Colors.black54;
    final Color borderColor =
    isDark ? Colors.white24 : Colors.indigo;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        actions: [
          IconButton(
            icon: Icon(compareMode ? Icons.close : Icons.compare),
            onPressed: () {
              setState(() {
                compareMode = !compareMode;
                selectedBankIds.clear();
              });
            },
          ),
          if (compareMode && selectedBankIds.length == 2)
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () async {
                final selectedBanks = banks
                    .where((b) => selectedBankIds.contains(b['id']))
                    .toList();

                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BankComparisonScreen(
                      bank1: selectedBanks[0],
                      bank2: selectedBanks[1],
                    ),
                  ),
                );

                resetComparison();
              },
            ),
        ],
      ),
      body: Column(
        children: [
          // 🔍 SEARCH BAR (DARK SAFE)
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: 'Search bank',
                hintStyle: TextStyle(color: subTextColor),
                prefixIcon: Icon(Icons.search, color: subTextColor),
                filled: true,
                fillColor: cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                searchText = value;
                fetchBanks();
              },
            ),
          ),

          // 📋 BANK LIST
          Expanded(
            child: ListView.builder(
              itemCount: banks.length,
              itemBuilder: (context, index) {
                final bank = banks[index];
                final int bankId = bank['id'];
                final bool isSelected =
                selectedBankIds.contains(bankId);
                final bool isStarred =
                    bank['isBookmarked'] == 1;

                return Card(
                  color: cardColor,
                  elevation: isSelected ? 6 : 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: isSelected && compareMode
                        ? BorderSide(
                      color: borderColor,
                      width: 2,
                    )
                        : BorderSide.none,
                  ),
                  child: ListTile(
                    leading: compareMode
                        ? Icon(
                      isSelected
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: isSelected
                          ? Colors.indigo
                          : subTextColor,
                    )
                        : null,
                    title: Text(
                      bank['name'],
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      bank['contact'],
                      style: TextStyle(color: subTextColor),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isStarred
                            ? Icons.star
                            : Icons.star_border,
                        color: isStarred
                            ? Colors.amber
                            : subTextColor,
                      ),
                      onPressed: () {
                        toggleStar(
                          bankId,
                          bank['isBookmarked'],
                        );
                      },
                    ),
                    onTap: () {
                      if (compareMode) {
                        toggleCompareSelection(bankId);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                BankDetailScreen(bank: bank),
                          ),
                        );
                      }
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
