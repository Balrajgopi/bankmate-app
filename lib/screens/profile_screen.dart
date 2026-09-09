import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../database/db_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? imagePath;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {

    final db = await DBHelper.database;

    final result = await db.query('users');

    if (result.isNotEmpty) {

      final user = result.first;

      nameController.text = user['name']?.toString() ?? "";
      emailController.text = user['email']?.toString() ?? "";
      passwordController.text = user['password']?.toString() ?? "";

      imagePath = user['image']?.toString();
    }

    setState(() {});
  }

  Future<void> pickImage() async {

    final picker = ImagePicker();

    final image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  Future<void> saveProfile() async {

    final db = await DBHelper.database;

    final data = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "image": imagePath
    };

    final existing = await db.query('users');

    if (existing.isEmpty) {

      await db.insert("users", data);

    } else {

      await db.update(
        "users",
        data,
        where: "id=?",
        whereArgs: [existing.first['id']],
      );
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile Updated Successfully"),
      ),
    );

    Navigator.pop(context);
  }

  Widget inputField(String label, TextEditingController controller) {

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
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

      appBar: AppBar(
        title: const Text("My Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [

            /// PROFILE IMAGE
            Center(
              child: GestureDetector(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: imagePath != null
                      ? FileImage(File(imagePath!))
                      : null,
                  child: imagePath == null
                      ? const Icon(Icons.camera_alt, size: 30)
                      : null,
                ),
              ),
            ),

            const SizedBox(height: 30),

            inputField("Name", nameController),
            inputField("Email", emailController),
            inputField("Password", passwordController),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveProfile,
              child: const Text("Save Profile"),
            )
          ],
        ),
      ),
    );
  }
}