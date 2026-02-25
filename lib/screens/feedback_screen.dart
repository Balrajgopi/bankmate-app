import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void submitFeedback() {
    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Feedback submitted successfully')),
      );

      nameController.clear();
      emailController.clear();
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              // 👤 NAME
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty
                    ? 'Please enter your name'
                    : null,
              ),

              const SizedBox(height: 16),

              // 📧 EMAIL
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty
                    ? 'Please enter your email'
                    : null,
              ),

              const SizedBox(height: 16),

              // 💬 MESSAGE
              TextFormField(
                controller: messageController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty
                    ? 'Please enter your message'
                    : null,
              ),

              const SizedBox(height: 24),

              // 🚀 SUBMIT BUTTON
              ElevatedButton(
                onPressed: submitFeedback,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}