import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/cards/cards_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/app_colors.dart';

class MyCardsScreen extends StatefulWidget {
  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  bool isEditMode = false;

  final cards = [
    {
      'icon': 'assets/icons/card.svg',
      'label': 'Debit Card',
      'number': '•••• •••• •••• 1234',
      'expiry': '03/25',
      'isDefault': true,
    },
    {
      'icon': 'assets/icons/card.svg',
      'label': 'Credit Card',
      'number': '•••• •••• •••• 5678',
      'expiry': '03/25',
      'isDefault': false,
    },
  ];
  Widget buildCustomAppBar({String title = 'All Categories'}) {
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

  @override
  Widget build(BuildContext context) {
    final cardBg = Color(0xFFF9F8FC);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCustomAppBar(title: "My Cards"),

            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saved Cards',
                    style: TextStyle(
                      color: Color(0xFFA29EA3),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isEditMode = !isEditMode;
                      });
                    },
                    child: Text(
                      isEditMode ? 'Done' : 'Edit',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cards.length,
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = cards[index];
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/card.svg"),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['label'].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Color(0xFF231531),
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      item['number'].toString(),
                                      style: TextStyle(letterSpacing: 1.3),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Expiry Date: ${item['expiry'] ?? ''}",
                                      style: TextStyle(
                                        color: Color(0xFFA29EA3),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (item['isDefault'] == true)
                                Padding(
                                  padding: EdgeInsets.only(top: 2, right: 2),
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Color(0xFFD6F5CF),
                                    child: Icon(
                                      Icons.check,
                                      color: Color(0xFF3AAA35),
                                      size: 16,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    if (isEditMode)
                      Padding(
                        padding: EdgeInsets.only(left: 6, top: 2),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.delete,
                            color: Color(0xFFFF6161),
                            size: 28,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: GestureDetector(
                onTap: () {
                  context.goTo(CardDetailsScreen());
                },
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/add-circle.svg"),
                    SizedBox(width: 7),
                    Text(
                      "Add New Card",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
