import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class BankDetailScreen extends StatefulWidget {
  final Map<String, dynamic> bank;

  const BankDetailScreen({super.key, required this.bank});

  @override
  State<BankDetailScreen> createState() => _BankDetailScreenState();
}

class _BankDetailScreenState extends State<BankDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Map<String, dynamic>? interestRate;
  Map<String, dynamic>? scheme;
  Map<String, dynamic>? account;
  Map<String, dynamic>? fees;
  Map<String, dynamic>? branch;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    loadBankDetails();
  }

  void loadBankDetails() async {
    final db = await DBHelper.database;

    final rateList = await db.query(
      'interest_rate',
      where: 'bankId = ?',
      whereArgs: [widget.bank['id']],
    );

    final schemeList = await db.query(
      'scheme',
      where: 'bankId = ?',
      whereArgs: [widget.bank['id']],
    );

    final accountList = await db.query(
      'account_opening',
      where: 'bankId = ?',
      whereArgs: [widget.bank['id']],
    );

    final feesList = await db.query(
      'fees',
      where: 'bankId = ?',
      whereArgs: [widget.bank['id']],
    );

    final branchList = await db.query(
      'branch',
      where: 'bankId = ?',
      whereArgs: [widget.bank['id']],
    );

    setState(() {
      interestRate = rateList.isNotEmpty ? rateList.first : null;
      scheme = schemeList.isNotEmpty ? schemeList.first : null;
      account = accountList.isNotEmpty ? accountList.first : null;
      fees = feesList.isNotEmpty ? feesList.first : null;
      branch = branchList.isNotEmpty ? branchList.first : null;
    });
  }

  Widget noData() {
    return const Center(
      child: Text(
        'No data available',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget infoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bank['name']),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Basic'),
            Tab(text: 'Rates'),
            Tab(text: 'Schemes'),
            Tab(text: 'Account'),
            Tab(text: 'Fees'),
            Tab(text: 'Branch'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 🔹 BASIC INFO
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.bank['history'],
              style: const TextStyle(fontSize: 16),
            ),
          ),

          // 🔹 INTEREST RATES
          interestRate == null
              ? noData()
              : Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoText(
                    'Savings Rate: ${interestRate!['savingsRate']}'),
                infoText('FD Rate: ${interestRate!['fdRate']}'),
                infoText('Loan Rate: ${interestRate!['loanRate']}'),
              ],
            ),
          ),

          // 🔹 SCHEMES
          scheme == null
              ? noData()
              : Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  scheme!['schemeName'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  scheme!['description'],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),

          // 🔹 ACCOUNT OPENING
          account == null
              ? noData()
              : Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoText('Documents: ${account!['documents']}'),
                infoText('Eligibility: ${account!['eligibility']}'),
                infoText(
                    'Minimum Balance: ${account!['minimumBalance']}'),
              ],
            ),
          ),

          // 🔹 FEES
          fees == null
              ? noData()
              : Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              fees!['details'],
              style: const TextStyle(fontSize: 16),
            ),
          ),

          // 🔹 BRANCH / ATM
          branch == null
              ? noData()
              : Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoText('Address: ${branch!['address']}'),
                infoText('Contact: ${branch!['contact']}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
