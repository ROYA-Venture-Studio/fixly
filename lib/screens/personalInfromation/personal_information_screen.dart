import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../core/app_colors.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  Widget buildCustomAppBar(
    BuildContext context, {
    String title = 'All Categories',
  }) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 8,
        bottom: 8,
      ),
      color: Colors.white,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(32),
            child: SvgPicture.asset("assets/icons/back.svg"),
          ),
          SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'EG');

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildCustomAppBar(context, title: "Personal Information"),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9EA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Color(0xFFDCAA25),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your profile is 20% complete.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF231531),
                                ),
                              ),
                              Text(
                                'Complete it now!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF231531),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    // Avatar with edit button
                    Center(
                      child: SizedBox(
                        height: 112,
                        width: 88,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 46,
                              backgroundImage: AssetImage(
                                "assets/images/profile.png",
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: SvgPicture.asset("assets/icons/edit.svg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First Name",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: _firstNameController,
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
                              Text("Last Name", style: TextStyle(fontSize: 12)),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: _lastNameController,
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
                    SizedBox(height: 16),
                    Text("Email", style: TextStyle(fontSize: 12)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
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
                    SizedBox(height: 16),
                    Text("Phone Number", style: TextStyle(fontSize: 12)),
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
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
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
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Required"
                                  : null,
                      countries: ['EG'],
                      selectorTextStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {}, // Implement your save logic.
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      "Save Changes",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
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
