import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'EG');
  bool _obscurePass1 = true;
  bool _obscurePass2 = true;
  bool _termsAccepted = false;

  String? nameValidator(String? value) =>
      value == null || value.isEmpty ? "Required" : null;

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return "Required";
    final emailReg = RegExp(r"^[^@]+@[^@]+\.[^@]+");
    if (!emailReg.hasMatch(value)) return "Enter valid email";
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return "Required";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  String? confirmValidator(String? value) {
    if (value == null || value.isEmpty) return "Required";
    if (value != _passController.text) return "Passwords do not match";
    return null;
  }

  void submit() {
    if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please accept Terms & Conditions")),
      );
      return;
    }
    if (_formKey.currentState?.validate() ?? false) {
      context.goOffAll(LoginScreen());
    }
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
                "Hello",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: primaryColor,
                ),
              ),
              Text(
                "There!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Create an account and get your home fixed.",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("First Name", style: TextStyle(fontSize: 12)),
                            Text(
                              " *",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _firstNameController,
                          validator: nameValidator,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 12),
                            hintText: "Enter your first name",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black12,
                                width: 1,
                              ),
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
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Last Name", style: TextStyle(fontSize: 12)),
                            Text(
                              " *",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _lastNameController,
                          validator: nameValidator,
                          decoration: InputDecoration(
                            hintText: "Enter your last name",
                            hintStyle: TextStyle(fontSize: 12),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black12,
                                width: 1,
                              ),
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Text("Phone Number", style: TextStyle(fontSize: 12)),
                  Text(" *", style: TextStyle(fontSize: 12, color: Colors.red)),
                ],
              ),
              SizedBox(height: 8),
              InternationalPhoneNumberInput(
                onInputChanged: (value) => phoneNumber = value,
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  showFlags: true,
                  setSelectorButtonAsPrefixIcon: true,
                  leadingPadding: 6,
                  useEmoji: false,
                ),
                initialValue: phoneNumber,
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                formatInput: true,
                textStyle: TextStyle(fontSize: 14, color: Colors.black87),
                inputDecoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black38),
                  filled: true,
                  fillColor: Colors.transparent,
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
                validator:
                    (value) =>
                        value == null || value.isEmpty ? "Required" : null,
                countries: ['EG'],
                selectorTextStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 24),
              Text("Email", style: TextStyle(fontSize: 12)),
              SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                validator: emailValidator,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(fontSize: 12),

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
              Row(
                children: [
                  Text("Password", style: TextStyle(fontSize: 12)),
                  Text(" *", style: TextStyle(fontSize: 12, color: Colors.red)),
                ],
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _passController,
                obscureText: _obscurePass1,
                validator: passwordValidator,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 12),

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
              Row(
                children: [
                  Text("Confirm Password", style: TextStyle(fontSize: 12)),
                  Text(" *", style: TextStyle(fontSize: 12, color: Colors.red)),
                ],
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _confirmController,
                obscureText: _obscurePass2,
                validator: confirmValidator,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 12),

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
              SizedBox(height: 18),
              Row(
                children: [
                  Checkbox(
                    value: _termsAccepted,
                    onChanged:
                        (v) => setState(() => _termsAccepted = v ?? false),
                  ),
                  Flexible(
                    child: Wrap(
                      children: [
                        Text("I agree to Fixly "),
                        GestureDetector(
                          onTap: () {
                            // Open Terms screen
                          },
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
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
                    "Create Account",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
                  SvgPicture.asset('assets/icons/apple.svg'),
                  SizedBox(width: 16),
                  SvgPicture.asset('assets/icons/facebook.svg'),
                  SizedBox(width: 16),
                  SvgPicture.asset('assets/icons/google.svg'),
                ],
              ),
              SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
