import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguagesScreen extends StatelessWidget {
  final selected = "English";
  final accent = Color(0xFF635B6A);
  final cardBg = Color(0xFFF9F8FC);
  final checkColor = Color(0xFF3AAA35);

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
            buildCustomAppBar(context, "Languages"),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 6),
              child: Text(
                'Suggested Languages',
                style: TextStyle(color: Color(0xFFA29EA3), fontSize: 14),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ...["English", "Arabic"].map(
                    (lang) => Container(
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        leading: CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFFF6F2FF),
                          child: SvgPicture.asset(
                            "assets/icons/global.svg",
                            width: 24,
                          ),
                        ),
                        title: Text(
                          lang,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: accent,
                          ),
                        ),
                        trailing:
                            lang == selected
                                ? CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Color(0xFFD6F5CF),
                                  child: Icon(
                                    Icons.check,
                                    color: checkColor,
                                    size: 18,
                                  ),
                                )
                                : null,
                        onTap: () {},
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
