import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../database/db_helper.dart';
import 'bank_info_detail_screen.dart';

class BankDetailScreen extends StatefulWidget {
  final Map<String, dynamic> bank;

  const BankDetailScreen({
    super.key,
    required this.bank,
  });

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

  Widget sectionCard(
      String title,
      String content,
      IconData icon,
      ) {

    return GestureDetector(

      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BankInfoDetailScreen(
              bankName: widget.bank['name'],   // ✅ FIXED
              title: title,
            ),
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06), // ✅ FIXED
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
                    color: Colors.blue.withValues(alpha: 0.1), // ✅ FIXED
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: Colors.blue),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.grey),

              ],
            ),

            const SizedBox(height: 12),

            Text(
              content,
              style: const TextStyle(
                height: 1.6,
                fontSize: 15,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

          ],
        ),
      ),
    );
  }

  Future<void> openBranchLocator(String url) async {

    final Uri uri = Uri.parse(url);

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> openNearbyBanks() async {

    String bankName = widget.bank['name'];

    final Uri mapUrl = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$bankName+near+me");

    await launchUrl(
      mapUrl,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.bank['name']),
      ),

      body: FutureBuilder<Map<String, dynamic>?>(

        future: fetchDetails(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator());
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

                const SizedBox(height: 20),

                Row(
                  children: [

                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.language),
                        label: const Text("WebSite"),
                        onPressed: () {
                          openBranchLocator(
                              data['branchLocator']);
                        },
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.map),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        label: const Text("Nearby Banks"),
                        onPressed: openNearbyBanks,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}