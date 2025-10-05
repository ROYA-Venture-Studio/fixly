import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/auth/forgetPassword/forget_password_screen.dart';
import 'package:fixly/screens/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  // Simple email or phone validator
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty)
      return "Please enter your email or phone";
    final emailReg = RegExp(r"^[^@]+@[^@]+\.[^@]+");
    final phoneReg = RegExp(r"^[0-9]{8,}$");
    if (!emailReg.hasMatch(value) && !phoneReg.hasMatch(value))
      return "Enter valid email or phone";
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return "Please enter your password";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: primaryColor,
                  height: 1.1,
                ),
              ),
              Text(
                "Back!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Sign in to access your account.",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              SizedBox(height: 32),
              Text(
                "Email / Phone Number",
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                validator: emailValidator,
                decoration: InputDecoration(
                  hintText: "Enter your email/phone",
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
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Password",
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
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
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        side: BorderSide(color: Colors.grey.shade400),
                        value: _rememberMe,
                        onChanged: (v) {
                          setState(() => _rememberMe = v ?? false);
                        },
                      ),
                      Text("Remember me"),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.goTo(ForgetPasswordScreen());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: primaryColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Login logic here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    // padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/facebook.svg'),
                  SizedBox(width: 16),
                  SvgPicture.asset('assets/icons/google.svg'),
                  SizedBox(width: 16),
                  SvgPicture.asset('assets/icons/apple.svg'),
                ],
              ),
              SizedBox(height: 36),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goTo(RegisterScreen());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
