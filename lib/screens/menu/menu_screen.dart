import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/addresses/addresses_screen.dart';
import 'package:fixly/screens/cards/cards_screen.dart';
import 'package:fixly/screens/help/help_screen.dart';
import 'package:fixly/screens/language/languages_screen.dart';
import 'package:fixly/screens/personalInfromation/personal_information_screen.dart';
import 'package:fixly/screens/savedTechnicians/saved_technicians_screen.dart';
import 'package:fixly/screens/talkToUs/talk_to_us_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Menu',
          style: TextStyle(
            color: Color(0xFF231531),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        children: [
          SizedBox(height: 10),
          Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFFA29EA3),
            ),
          ),
          SizedBox(height: 16),

          // Profile Section
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    'assets/images/profile.png',
                  ), // Your profile image
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Jonathan Jackson',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 3),
                          SvgPicture.asset("assets/icons/verify.svg"),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/location.svg"),
                          SizedBox(width: 2),
                          Text(
                            'London, UK',
                            style: TextStyle(color: Color(0xFFA29EA3)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.goTo(PersonalInfoScreen());
                  },
                  child: SvgPicture.asset("assets/icons/edit.svg"),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
          // Account Section
          Text(
            'Account',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFFA29EA3),
            ),
          ),
          SizedBox(height: 10),
          buildMenuTile(
            "assets/icons/book.svg",
            "Address Book",
            onTap: () {
              context.goTo(AddressesScreen());
            },
          ),
          buildMenuTile(
            "assets/icons/card.svg",
            "Saved Cards",
            onTap: () {
              context.goTo(MyCardsScreen());
            },
          ),
          buildMenuTile(
            "assets/icons/save-2.svg",
            "Saved Technicians",
            onTap: () {
              context.goTo(SavedTechniciansScreen());
            },
          ),
          SizedBox(height: 18),
          // Settings Section
          Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFFA29EA3),
            ),
          ),
          SizedBox(height: 10),
          buildMenuTile(
            "assets/icons/global.svg",
            "Language",
            value: "English",
            onTap: () {
              context.goTo(LanguagesScreen());
            },
          ),
          buildMenuTile(
            "assets/icons/message-question.svg",
            "Help",
            onTap: () {
              context.goTo(HelpScreen());
            },
          ),
          buildMenuTile(
            "assets/icons/message-2.svg",
            "Talk to us",
            onTap: () {
              context.goTo(TalkToUsScreen());
            },
          ),
          buildMenuTile("assets/icons/logout.svg", "Logout"),
        ],
      ),
    );
  }

  Widget buildMenuTile(
    String icon,
    String label, {
    String? value,
    void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: SvgPicture.asset(icon),
        title: Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
        trailing:
            value != null
                ? Text(value, style: TextStyle(color: Color(0xFFA29EA3)))
                : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        tileColor: Color(0xFFF9F8FC),
        onTap: onTap,
      ),
    );
  }
}
