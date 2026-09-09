import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'bank_comparison_screen.dart';

class BankCompareSelectorScreen extends StatefulWidget {
  const BankCompareSelectorScreen({super.key});

  @override
  State<BankCompareSelectorScreen> createState() =>
      _BankCompareSelectorScreenState();
}

class _BankCompareSelectorScreenState
    extends State<BankCompareSelectorScreen> {

  List<Map<String, dynamic>> banks = [];
  List<Map<String, dynamic>> selectedBanks = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBanks();
  }

  Future<void> loadBanks() async {

    final db = await DBHelper.database;

    final result = await db.query('bank');

    setState(() {
      banks = result;
      isLoading = false;
    });
  }

  /// SELECT / DESELECT BANK
  void toggleSelection(Map<String, dynamic> bank) {

    setState(() {

      final alreadySelected =
      selectedBanks.any((b) => b['id'] == bank['id']);

      if (alreadySelected) {

        selectedBanks.removeWhere((b) => b['id'] == bank['id']);

      } else {

        if (selectedBanks.length < 2) {

          selectedBanks.add(bank);

        } else {

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Only 2 banks can be selected"),
            ),
          );
        }
      }
    });
  }

  /// CHECK IF BANK IS SELECTED
  bool isSelected(Map<String, dynamic> bank) {

    return selectedBanks.any((b) => b['id'] == bank['id']);
  }

  /// RESET SELECTION
  void resetSelection() {
    setState(() {
      selectedBanks.clear();
    });
  }

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Select Banks to Compare"),
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: banks.length,

        itemBuilder: (context, index) {

          final bank = banks[index];

          final selected = isSelected(bank);

          return GestureDetector(

            onTap: () => toggleSelection(bank),

            child: Container(

              margin: const EdgeInsets.only(bottom: 14),

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(

                color: selected
                    ? Colors.blue.withOpacity(0.12)
                    : (isDark
                    ? Colors.grey.shade900
                    : Colors.white),

                borderRadius: BorderRadius.circular(18),

                border: Border.all(
                  color: selected
                      ? Colors.blue
                      : Colors.transparent,
                  width: 2,
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Row(

                children: [

                  /// BANK ICON
                  CircleAvatar(
                    backgroundColor:
                    Colors.blue.withOpacity(0.1),
                    child: const Icon(
                      Icons.account_balance,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(width: 16),

                  /// BANK NAME
                  Expanded(
                    child: Text(
                      bank['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// CHECK ICON
                  if (selected)
                    const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                      size: 26,
                    ),
                ],
              ),
            ),
          );
        },
      ),

      /// COMPARE BUTTON
      floatingActionButton: selectedBanks.length == 2
          ? FloatingActionButton.extended(

        icon: const Icon(Icons.compare),

        label: const Text("Compare"),

        onPressed: () async {

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BankComparisonScreen(
                bank1: selectedBanks[0],
                bank2: selectedBanks[1],
              ),
            ),
          );

          /// RESET AFTER RETURN
          resetSelection();
        },
      )
          : null,
    );
  }
}