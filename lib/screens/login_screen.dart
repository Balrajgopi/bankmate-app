import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/db_helper.dart';
import 'signup_screen.dart';
import 'main_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final emailController =
  TextEditingController();
  final passwordController =
  TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;

  Future<void> loginUser() async {

    if (!_formKey.currentState!.validate())
      return;

    setState(() => isLoading = true);

    final db = await DBHelper.database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [
        emailController.text.trim(),
        passwordController.text.trim(),
      ],
    );

    if (result.isNotEmpty) {

      final user = result.first;

      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setBool(
          'isLoggedIn', true);

      // ✅ FIXED TYPE ISSUE HERE
      await prefs.setString(
        'userName',
        (user['name'] ?? "User").toString(),
      );

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) =>
          const MainNavigationScreen(),
        ),
            (route) => false,
      );

    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content:
          Text("Invalid Email or Password"),
        ),
      );
    }

    setState(() => isLoading = false);
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter email";
    }
    if (!RegExp(r'\S+@\S+\.\S+')
        .hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(title: const Text("Login")),
      body: Padding(
        padding:
        const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              const SizedBox(height: 40),

              TextFormField(
                controller: emailController,
                validator: emailValidator,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon:
                  const Icon(Icons.email),
                  border:
                  OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(
                        14),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller:
                passwordController,
                obscureText:
                obscurePassword,
                validator: (v) =>
                v == null || v.isEmpty
                    ? "Enter password"
                    : null,
                decoration:
                InputDecoration(
                  labelText:
                  "Password",
                  prefixIcon:
                  const Icon(
                      Icons.lock),
                  suffixIcon:
                  IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons
                          .visibility
                          : Icons
                          .visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword =
                        !obscurePassword;
                      });
                    },
                  ),
                  border:
                  OutlineInputBorder(
                    borderRadius:
                    BorderRadius
                        .circular(14),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed:
                isLoading
                    ? null
                    : loginUser,
                style: ElevatedButton
                    .styleFrom(
                  padding:
                  const EdgeInsets
                      .symmetric(
                      vertical:
                      16),
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius
                        .circular(
                        14),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(
                  color:
                  Colors.white,
                )
                    : const Text(
                  "Login",
                  style: TextStyle(
                      fontSize:
                      16),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                        const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}