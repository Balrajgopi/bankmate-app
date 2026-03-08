import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/db_helper.dart';
import 'main_navigation_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;

  Future<void> signupUser() async {

    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    final db = await DBHelper.database;

    try {

      await db.insert('users', {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      });

      // 🔥 Auto Login After Signup
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userName', nameController.text.trim());

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigationScreen(),
        ),
            (route) => false,
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email already exists"),
        ),
      );
    }

    setState(() => isLoading = false);
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter email";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Enter valid email";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? obscurePassword : false,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              obscurePassword
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          )
              : null,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              const SizedBox(height: 20),

              buildTextField(
                controller: nameController,
                label: "Full Name",
                icon: Icons.person,
                validator: (v) =>
                v == null || v.isEmpty
                    ? "Please enter name"
                    : null,
              ),

              buildTextField(
                controller: emailController,
                label: "Email",
                icon: Icons.email,
                validator: emailValidator,
              ),

              buildTextField(
                controller: passwordController,
                label: "Password",
                icon: Icons.lock,
                isPassword: true,
                validator: passwordValidator,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: isLoading ? null : signupUser,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}