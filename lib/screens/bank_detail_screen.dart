import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../database/db_helper.dart';

class BankDetailScreen extends StatefulWidget {
  final Map<String, dynamic> bank;

  const BankDetailScreen({super.key, required this.bank});

  @override
  State<BankDetailScreen> createState() => _BankDetailScreenState();
}

class _BankDetailScreenState extends State<BankDetailScreen> {

  Future<Map<String, dynamic>?> fetchDetails() async {
    final db = await DBHelper.database;

    final result = await db.query(
      'bank_details',
      where: 'bankId = ?',
      whereArgs: [widget.bank['id']],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Widget sectionCard(String title, String content, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.blue),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              height: 1.6,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> openBranchLocator(String url) async {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.bank['name'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchDetails(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [

                sectionCard(
                  "Basic Information",
                  data['basic'] ?? "",
                  Icons.info_outline,
                ),

                sectionCard(
                  "Interest Rates",
                  data['rates'] ?? "",
                  Icons.percent,
                ),

                sectionCard(
                  "Schemes",
                  data['schemes'] ?? "",
                  Icons.assignment,
                ),

                sectionCard(
                  "Account Types",
                  data['account'] ?? "",
                  Icons.account_balance_wallet,
                ),

                sectionCard(
                  "Fees & Charges",
                  data['fees'] ?? "",
                  Icons.currency_rupee,
                ),

                sectionCard(
                  "Branch Network",
                  data['branch'] ?? "",
                  Icons.location_on,
                ),

                const SizedBox(height: 10),

                // 🔵 PREMIUM BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    openBranchLocator(data['branchLocator']);
                  },
                  child: const Text(
                    "Open Branch Locator",
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          );
        },
      ),
    );
  }
}