import 'package:flutter/material.dart';
import 'dart:math';

class EmiCalculatorScreen extends StatefulWidget {
  const EmiCalculatorScreen({super.key});

  @override
  State<EmiCalculatorScreen> createState() =>
      _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState
    extends State<EmiCalculatorScreen> {

  final principalController = TextEditingController();
  final rateController = TextEditingController();
  final tenureController = TextEditingController();

  double emi = 0.0;

  void calculateEmi() {
    final principal =
    double.tryParse(principalController.text);
    final rate =
    double.tryParse(rateController.text);
    final tenure =
    double.tryParse(tenureController.text);

    if (principal == null ||
        rate == null ||
        tenure == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter valid values"),
        ),
      );
      return;
    }

    double monthlyRate = rate / (12 * 100);
    double months = tenure * 12;

    double calculatedEmi = (principal *
        monthlyRate *
        pow(1 + monthlyRate, months)) /
        (pow(1 + monthlyRate, months) - 1);

    setState(() {
      emi = calculatedEmi;
    });
  }

  void resetFields() {
    principalController.clear();
    rateController.clear();
    tenureController.clear();
    setState(() {
      emi = 0.0;
    });
  }

  Widget inputCard(
      String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color:
            Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("EMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [

            // 🔹 INPUTS
            inputCard("Loan Amount (₹)",
                principalController),
            inputCard("Interest Rate (%)",
                rateController),
            inputCard("Loan Tenure (Years)",
                tenureController),

            const SizedBox(height: 10),

            // 🔹 CALCULATE BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(
                    vertical: 14),
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                ),
              ),
              onPressed: calculateEmi,
              child: const Text(
                "Calculate EMI",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 RESULT CARD
            Container(
              padding:
              const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.grey.shade900
                    : Colors.blue.shade50,
                borderRadius:
                BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  const Text(
                    "Monthly EMI",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    emi == 0.0
                        ? "₹ 0"
                        : "₹ ${emi.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 RESET BUTTON
            OutlinedButton(
              style:
              OutlinedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(
                    vertical: 14),
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                ),
              ),
              onPressed: resetFields,
              child: const Text(
                "Reset",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}