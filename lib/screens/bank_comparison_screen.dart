import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class BankComparisonScreen extends StatelessWidget {
  final Map<String, dynamic> bank1;
  final Map<String, dynamic> bank2;

  const BankComparisonScreen({
    super.key,
    required this.bank1,
    required this.bank2,
  });

  Future<Map<String, dynamic>> fetchExtraData(int bankId) async {
    final db = await DBHelper.database;

    final rate = (await db.query(
      'interest_rate',
      where: 'bankId = ?',
      whereArgs: [bankId],
    ))
        .first;

    final account = (await db.query(
      'account_opening',
      where: 'bankId = ?',
      whereArgs: [bankId],
    ))
        .first;

    final fees = (await db.query(
      'fees',
      where: 'bankId = ?',
      whereArgs: [bankId],
    ))
        .first;

    return {
      'rate': rate,
      'account': account,
      'fees': fees,
    };
  }

  Widget comparisonRow(
      String title,
      String value1,
      String value2,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              value1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bankHeader(String name, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const Icon(Icons.account_balance,
                color: Colors.white, size: 30),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Comparison'),
      ),
      body: FutureBuilder(
        future: Future.wait([
          fetchExtraData(bank1['id']),
          fetchExtraData(bank2['id']),
        ]),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator());
          }

          final data1 =
          snapshot.data![0] as Map<String, dynamic>;
          final data2 =
          snapshot.data![1] as Map<String, dynamic>;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                // 🔵 Bank Headers
                Row(
                  children: [
                    bankHeader(
                        bank1['name'], Colors.blue),
                    const SizedBox(width: 10),
                    bankHeader(
                        bank2['name'], Colors.indigo),
                  ],
                ),

                const SizedBox(height: 25),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.all(16),
                    child: Column(
                      children: [

                        comparisonRow(
                          "Savings Rate",
                          "${data1['rate']['savingsRate']}%",
                          "${data2['rate']['savingsRate']}%",
                        ),

                        const Divider(),

                        comparisonRow(
                          "FD Rate",
                          "${data1['rate']['fdRate']}%",
                          "${data2['rate']['fdRate']}%",
                        ),

                        const Divider(),

                        comparisonRow(
                          "Loan Rate",
                          "${data1['rate']['loanRate']}%",
                          "${data2['rate']['loanRate']}%",
                        ),

                        const Divider(),

                        comparisonRow(
                          "Minimum Balance",
                          "${data1['account']['minimumBalance']}",
                          "${data2['account']['minimumBalance']}",
                        ),

                        const Divider(),

                        comparisonRow(
                          "Fees",
                          "${data1['fees']['details']}",
                          "${data2['fees']['details']}",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}