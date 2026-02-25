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

  String selectedLanguage = "English";

  Future<Map<String, dynamic>> fetchDetails() async {
    final db = await DBHelper.database;

    final detail = (await db.query(
      'bank_details',
      where: 'bankId = ?',
      whereArgs: [widget.bank['id']],
    )).first;

    return detail;
  }

  // 🌍 SIMPLE LOCAL TRANSLATION LOGIC
  String translate(String text) {
    if (selectedLanguage == "Hindi") {
      return "हिंदी: $text";
    } else if (selectedLanguage == "Marathi") {
      return "मराठी: $text";
    }
    return text;
  }

  Future<void> openBranch(String url) async {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  Widget buildSection(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Text(
            translate(content),
            style: const TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bank['name']),
        actions: [

          // 🌍 LANGUAGE DROPDOWN
          DropdownButton<String>(
            value: selectedLanguage,
            underline: const SizedBox(),
            dropdownColor: Theme.of(context).cardColor,
            items: const [
              DropdownMenuItem(
                value: "English",
                child: Text("EN"),
              ),
              DropdownMenuItem(
                value: "Hindi",
                child: Text("HI"),
              ),
              DropdownMenuItem(
                value: "Marathi",
                child: Text("MR"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedLanguage = value!;
              });
            },
          ),

          const SizedBox(width: 10),
        ],
      ),

      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchDetails(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                buildSection("Basic Information", data['basic']),
                buildSection("Interest Rates", data['rates']),
                buildSection("Schemes", data['schemes']),
                buildSection("Account Types", data['account']),
                buildSection("Fees & Charges", data['fees']),
                buildSection("Branch Network", data['branch']),

                const SizedBox(height: 10),

                // 🔗 BRANCH LOCATOR BUTTON
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () => openBranch(data['branchLocator']),
                  icon: const Icon(Icons.location_on),
                  label: const Text("Open Branch Locator"),
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