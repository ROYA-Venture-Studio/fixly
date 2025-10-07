import 'package:fixly/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailsScreen extends StatefulWidget {
  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController labelController = TextEditingController();

  bool markDefault = false;

  @override
  Widget build(BuildContext context) {
    final accent = Color(0xFF635B6A);
    final lightGray = Color(0xFFF9F8FC);

    bool fieldsFilled =
        cardNumberController.text.trim().isNotEmpty &&
        expiryController.text.trim().isNotEmpty &&
        cvvController.text.trim().isNotEmpty &&
        nameController.text.trim().isNotEmpty &&
        labelController.text.trim().isNotEmpty;

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
                      'Card Details',
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
                  Text("Card Number *", style: TextStyle(fontSize: 13)),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: cardNumberController,
                    decoration: InputDecoration(
                      hintText: "Card Number",
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
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Expiry Date *",
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: expiryController,
                              decoration: InputDecoration(
                                hintText: "MM/YY",
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
                            Text("CVV *", style: TextStyle(fontSize: 13)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: cvvController,
                              decoration: InputDecoration(
                                hintText: "CVV",
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
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text("Cardholder Name *", style: TextStyle(fontSize: 13)),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Cardholder Name",
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
                  Text("Card Label", style: TextStyle(fontSize: 13)),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: labelController,
                    decoration: InputDecoration(
                      hintText: "Card Label",
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
                  SizedBox(height: 11),
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: accent, size: 17),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "The Card Label differentiates between your saved cards.",
                          style: TextStyle(
                            fontSize: 13,
                            color: accent.withOpacity(0.71),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
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
                          activeColor: accent,
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
                  SizedBox(height: 20),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 22),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: fieldsFilled ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          fieldsFilled
                              ? primaryColor
                              : primaryColor.withOpacity(0.18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      "Save Card",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color:
                            fieldsFilled
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
