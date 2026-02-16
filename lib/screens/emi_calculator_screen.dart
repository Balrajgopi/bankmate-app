import 'package:flutter/material.dart';
import 'dart:math';

class EmiCalculatorScreen extends StatefulWidget {
  const EmiCalculatorScreen({super.key});

  @override
  State<EmiCalculatorScreen> createState() => _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
  final TextEditingController loanController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController tenureController = TextEditingController();

  double emi = 0;

  void calculateEmi() {
    final double principal = double.tryParse(loanController.text) ?? 0;
    final double annualRate = double.tryParse(rateController.text) ?? 0;
    final int months = int.tryParse(tenureController.text) ?? 0;

    if (principal <= 0 || annualRate <= 0 || months <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid values')),
      );
      return;
    }

    final double monthlyRate = annualRate / 12 / 100;

    final double emiValue =
        (principal * monthlyRate * pow(1 + monthlyRate, months)) /
            (pow(1 + monthlyRate, months) - 1);

    setState(() {
      emi = emiValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: loanController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Loan Amount (₹)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Interest Rate (%)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: tenureController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tenure (Months)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculateEmi,
              child: const Text('Calculate EMI'),
            ),
            const SizedBox(height: 20),

            if (emi > 0)
              Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Monthly EMI: ₹${emi.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
