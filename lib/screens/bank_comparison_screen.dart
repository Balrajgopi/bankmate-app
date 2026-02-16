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

    final rate =
        (await db.query('interest_rate', where: 'bankId = ?', whereArgs: [bankId])).first;

    final account =
        (await db.query('account_opening', where: 'bankId = ?', whereArgs: [bankId])).first;

    final fees =
        (await db.query('fees', where: 'bankId = ?', whereArgs: [bankId])).first;

    return {
      'rate': rate,
      'account': account,
      'fees': fees,
    };
  }

  Widget buildColumn(String title, Map<String, dynamic> data) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Text('Savings Rate: ${data['rate']['savingsRate']}'),
          Text('FD Rate: ${data['rate']['fdRate']}'),
          Text('Loan Rate: ${data['rate']['loanRate']}'),
          const SizedBox(height: 8),
          Text('Min Balance: ${data['account']['minimumBalance']}'),
          const SizedBox(height: 8),
          Text('Fees: ${data['fees']['details']}'),
        ],
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
            return const Center(child: CircularProgressIndicator());
          }

          final data1 = snapshot.data![0] as Map<String, dynamic>;
          final data2 = snapshot.data![1] as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                buildColumn(bank1['name'], data1),
                const VerticalDivider(),
                buildColumn(bank2['name'], data2),
              ],
            ),
          );
        },
      ),
    );
  }
}
