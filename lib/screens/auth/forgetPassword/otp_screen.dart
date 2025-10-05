import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/auth/forgetPassword/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  final String email; // Pass the email to show

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";

  void submitOtp() {
    if (otp.length != 6) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Enter 6-digit code")));
      return;
    }
    context.goTo(ChangePasswordScreen());
  }

  void resendOtp() {
    // Implement resend logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: primaryColor,
                ),
              ),
              Text(
                "OTP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Enter OTP number we’ve sent to",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              Row(
                children: [
                  Text(
                    widget.email,
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.deepPurple.shade200,
                focusedBorderColor: Colors.deepPurple,
                showFieldAsBox: true,
                margin: EdgeInsets.symmetric(horizontal: 4),
                fieldWidth: (context.width() - 80) / 6,
                fieldHeight: (context.width() - 80) / 6,
                borderRadius: BorderRadius.circular(12),
                onCodeChanged: (code) {
                  otp = code;
                },
                onSubmit: (code) => otp = code,
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: submitOtp,
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Haven’t receive the code yet?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    GestureDetector(
                      onTap: resendOtp,
                      child: Text(
                        "Re-send Code",
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
