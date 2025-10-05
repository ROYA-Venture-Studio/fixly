import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePass1 = true;
  bool _obscurePass2 = true;

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return "Please enter password";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  String? confirmValidator(String? value) {
    if (value == null || value.isEmpty) return "Please re-enter password";
    if (value != _passController.text) return "Passwords do not match";
    return null;
  }

  void submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.goOffAll(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Change",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: primaryColor,
                  ),
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Set your new password.",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                SizedBox(height: 32),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _passController,
                  obscureText: _obscurePass1,
                  validator: passwordValidator,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black26, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 1.2,
                      ),
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePass1 ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed:
                          () => setState(() => _obscurePass1 = !_obscurePass1),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _confirmController,
                  obscureText: _obscurePass2,
                  validator: confirmValidator,
                  decoration: InputDecoration(
                    hintText: "Re-Enter your password",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black26, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 1.2,
                      ),
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePass2 ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed:
                          () => setState(() => _obscurePass2 = !_obscurePass2),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      "Change Password",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
