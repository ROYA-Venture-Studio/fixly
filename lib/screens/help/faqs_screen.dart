import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FAQsScreen extends StatefulWidget {
  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final accent = Color(0xFF635B6A);
  final cardBg = Color(0xFFF9F8FC);

  // Sample FAQ data
  final faqs = [
    {
      "q": "What is Fixly?",
      "a": "Fixly is an app to book services easily and quickly.",
    },
    {
      "q": "How long does it take for my request to arrive?",
      "a": "Requests typically arrive within 60 minutes.",
    },
    {
      "q": "Can I cancel my booking?",
      "a": "You can cancel any booking from the Bookings screen.",
    },
    {
      "q": "Can I change the booking date & time?",
      "a": "Yes, you can edit booking time up to 2 hours before appointment.",
    },
  ];

  // Which FAQ is expanded
  int? expandedIndex;

  Widget buildCustomAppBar(BuildContext context, String title) => Container(
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
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(32),
          child: SvgPicture.asset("assets/icons/back.svg"),
        ),
        SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            color: accent,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCustomAppBar(context, "FAQs"),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  final faq = faqs[index];
                  final isExpanded = expandedIndex == index;
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          setState(() {
                            expandedIndex = isExpanded ? null : index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      faq["q"]!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: accent,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    isExpanded
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    color: accent,
                                  ),
                                ],
                              ),
                              if (isExpanded) ...[
                                SizedBox(height: 8),
                                Text(
                                  faq["a"]!,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFA29EA3),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom nav bar: add if used globally elsewhere in app
    );
  }
}
