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

    final rateResult = await db.query(
      'interest_rate',
      where: 'bankId = ?',
      whereArgs: [bankId],
    );

    final accountResult = await db.query(
      'account_opening',
      where: 'bankId = ?',
      whereArgs: [bankId],
    );

    final feesResult = await db.query(
      'fees',
      where: 'bankId = ?',
      whereArgs: [bankId],
    );

    return {
      'rate': rateResult.isNotEmpty ? rateResult.first : {},
      'account': accountResult.isNotEmpty ? accountResult.first : {},
      'fees': feesResult.isNotEmpty ? feesResult.first : {},
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
              value1.isEmpty ? "-" : value1,
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
              value2.isEmpty ? "-" : value2,
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

          final rate1 = data1['rate'] ?? {};
          final rate2 = data2['rate'] ?? {};

          final account1 = data1['account'] ?? {};
          final account2 = data2['account'] ?? {};

          final fees1 = data1['fees'] ?? {};
          final fees2 = data2['fees'] ?? {};

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

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
                          rate1['savingsRate']?.toString() ?? "",
                          rate2['savingsRate']?.toString() ?? "",
                        ),

                        const Divider(),

                        comparisonRow(
                          "FD Rate",
                          rate1['fdRate']?.toString() ?? "",
                          rate2['fdRate']?.toString() ?? "",
                        ),

                        const Divider(),

                        comparisonRow(
                          "Loan Rate",
                          rate1['loanRate']?.toString() ?? "",
                          rate2['loanRate']?.toString() ?? "",
                        ),

                        const Divider(),

                        comparisonRow(
                          "Minimum Balance",
                          account1['minimumBalance']?.toString() ?? "",
                          account2['minimumBalance']?.toString() ?? "",
                        ),

                        const Divider(),

                        comparisonRow(
                          "Fees",
                          fees1['details']?.toString() ?? "",
                          fees2['details']?.toString() ?? "",
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