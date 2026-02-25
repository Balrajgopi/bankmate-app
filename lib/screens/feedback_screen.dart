import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() =>
      _FeedbackScreenState();
}

class _FeedbackScreenState
    extends State<FeedbackScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final feedbackController =
  TextEditingController();

  int rating = 0;

  void submitFeedback() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        feedbackController.text.isEmpty ||
        rating == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content:
          Text("Please fill all fields"),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Thank You!"),
        content: const Text(
          "Your feedback has been submitted successfully.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget inputCard(
      String label,
      TextEditingController controller,
      {int maxLines = 1}) {
    return Container(
      margin:
      const EdgeInsets.only(bottom: 20),
      padding:
      const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withValues(alpha: 0.06),
            blurRadius: 10,
            offset:
            const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildStar(int index) {
    return IconButton(
      icon: Icon(
        rating >= index
            ? Icons.star
            : Icons.star_border,
        color: Colors.amber,
        size: 30,
      ),
      onPressed: () {
        setState(() {
          rating = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(20),
        child: ListView(
          children: [

            const Text(
              "We value your feedback",
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            inputCard(
                "Your Name",
                nameController),
            inputCard(
                "Your Email",
                emailController),
            inputCard(
              "Write your feedback",
              feedbackController,
              maxLines: 4,
            ),

            const SizedBox(height: 10),

            const Text(
              "Rate our App",
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                buildStar(1),
                buildStar(2),
                buildStar(3),
                buildStar(4),
                buildStar(5),
              ],
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style:
              ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(
                    vertical: 14),
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                ),
              ),
              onPressed: submitFeedback,
              child: const Text(
                "Submit Feedback",
                style: TextStyle(
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}