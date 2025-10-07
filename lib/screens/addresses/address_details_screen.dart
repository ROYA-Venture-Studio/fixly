import 'package:fixly/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddressDetailsScreen extends StatefulWidget {
  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  bool markDefault = false;
  bool isSomeoneElse = false;

  TextEditingController addressController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController aptController = TextEditingController();
  TextEditingController labelController = TextEditingController();

  TextEditingController otherFirstController = TextEditingController();
  TextEditingController otherLastController = TextEditingController();
  TextEditingController otherPhoneController = TextEditingController();

  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    final accentPurple = Color(0xFF635B6A);
    final lightGray = Color(0xFFF9F8FC);
    final lightPurple = Color(0xFFF6F2FF);

    // Example for initial filled state
    // addressController.text = "4140 Parker Rd. Allentown";
    // floorController.text = "1";
    // aptController.text = "152";
    // labelController.text = "Home";
    // markDefault = true;
    // isSomeoneElse = true;

    bool allMainFieldsFilled =
        (addressController.text.trim().isNotEmpty &&
            floorController.text.trim().isNotEmpty &&
            aptController.text.trim().isNotEmpty &&
            labelController.text.trim().isNotEmpty &&
            (!isSomeoneElse ||
                (otherFirstController.text.trim().isNotEmpty &&
                    otherLastController.text.trim().isNotEmpty &&
                    otherPhoneController.text.trim().isNotEmpty)));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(32),
                      child: SvgPicture.asset("assets/icons/back.svg"),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Address Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF231531),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/trash.svg"),
                          SizedBox(width: 3),
                          Text(
                            "Delete",
                            style: TextStyle(
                              color: Color(0xFFFF6161),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Address Details", style: TextStyle(fontSize: 13)),
                      Text(
                        " *",
                        style: TextStyle(fontSize: 13, color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: "Enter your address details e.g; Street name",
                      filled: true,
                      fillColor: lightGray,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 15,
                      ),
                      hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Floor Number",
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: floorController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Floor number",
                                filled: true,
                                fillColor: lightGray,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 15,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apartment Number",
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: aptController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Apartment number",
                                filled: true,
                                fillColor: lightGray,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 15,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text("Address Label", style: TextStyle(fontSize: 13)),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: labelController,
                    decoration: InputDecoration(
                      hintText: "Give your address a label e.g; Home or Work",
                      filled: true,
                      fillColor: lightGray,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 15,
                      ),
                      hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 17),
                  GestureDetector(
                    onTap: () => setState(() => markDefault = !markDefault),
                    child: Row(
                      children: [
                        Checkbox(
                          value: markDefault,
                          onChanged:
                              (v) => setState(() => markDefault = v ?? false),
                          activeColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: BorderSide(color: Color(0xFFA29EA3)),
                        ),
                        SizedBox(width: 4),
                        Text("Mark as default", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 232, 226, 237),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "This is someone else’s address",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xff231531),
                                    ),
                                  ),
                                  Text(
                                    "Provide their contact information for easy delivery.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: accentPurple.withOpacity(0.63),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Switch(
                              value: isSomeoneElse,
                              activeThumbColor: primaryColor,
                              onChanged: (val) {
                                setState(() => isSomeoneElse = val);
                              },
                            ),
                          ],
                        ),

                        if (isSomeoneElse) ...[
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  spacing: 8,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "First Name",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text(
                                          " *",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),

                                    TextFormField(
                                      controller: otherFirstController,
                                      decoration: InputDecoration(
                                        hintText: "First Name",
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 11,
                                          vertical: 15,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  spacing: 8,

                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Last Name",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text(
                                          " *",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: otherLastController,
                                      decoration: InputDecoration(
                                        hintText: "Last Name",
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 11,
                                          vertical: 15,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 11),
                          Row(
                            children: [
                              Text(
                                "Phone Number",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                " *",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.red,
                                ),
                              ),
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
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            formatInput: true,
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
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
                              fillColor: Colors.white,
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
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: 26),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 22),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: allMainFieldsFilled ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          allMainFieldsFilled
                              ? primaryColor
                              : primaryColor.withOpacity(0.18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      "Save Address",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color:
                            allMainFieldsFilled
                                ? Colors.white
                                : Colors.white.withOpacity(0.59),
                      ),
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
