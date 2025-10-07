import 'package:fixly/core/app_extras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'faqs_screen.dart';

class HelpScreen extends StatelessWidget {
  final accent = Color(0xFF635B6A);
  final cardBg = Color(0xFFF9F8FC);

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
            buildCustomAppBar(context, "Help"),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                children: [
                  ...["FAQs", "Other Issues"].map(
                    (label) => Container(
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Text(
                          label,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: accent,
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right, color: accent),
                        onTap: () {
                          context.goTo(FAQsScreen());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
