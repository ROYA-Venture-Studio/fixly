import 'package:flutter/material.dart';

const kPurple = Color(0xFF635B6A);
const kPurpleGray = Color(0xFFA29EA3);

class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool allowNotifications = true;

  void _showSettingsPopup() {
    showDialog(
      context: context,
      builder:
          (ctx) => Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 150),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 14)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mark_email_read_rounded,
                        color: kPurple.withOpacity(0.7),
                        size: 24,
                      ),
                      SizedBox(width: 13),
                      Text(
                        "Mark all as read",
                        style: TextStyle(
                          color: kPurple,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_rounded,
                        color: kPurple.withOpacity(0.5),
                        size: 22,
                      ),
                      SizedBox(width: 13),
                      Expanded(
                        child: Text(
                          "Allow Notifications",
                          style: TextStyle(
                            color: kPurple,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Switch(
                        value: allowNotifications,
                        onChanged:
                            (v) => setState(() => allowNotifications = v),
                        activeColor: kPurple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // بيانات مؤقتة مأخوذة من الصورة
    List<Map<String, dynamic>> todayNotifs = [
      {
        "title": "30% Special Discount!",
        "desc": "Special promotion only valid today",
        "time": "1 min ago",
        "icon": Icons.star_rate_rounded,
        "color": kPurple,
      },
      {
        "title": "Updated Password",
        "desc": "Your password was updated",
        "time": "02:53 PM",
        "icon": Icons.lock_outline_rounded,
        "color": kPurpleGray,
      },
    ];
    List<Map<String, dynamic>> prevNotifs = [
      {
        "title": "Account Setup",
        "desc": "Set up your account now",
        "time": "02:53 PM",
        "icon": Icons.person_outline,
        "color": kPurpleGray,
      },
      {
        "title": "New Card",
        "desc": "You have added a new card successfully",
        "time": "02:53 PM",
        "icon": Icons.credit_card_outlined,
        "color": kPurpleGray,
      },
      {
        "title": "Technician on the way",
        "desc": "Ahmed, your electrician, is arriving in 15 minutes.",
        "time": "02:53 PM",
        "icon": Icons.local_shipping_rounded,
        "color": kPurple,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar Custom
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 10),
              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: kPurple,
                        size: 21,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: _showSettingsPopup,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xfffaf9fb),
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: kPurple.withOpacity(0.16)),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.settings, color: kPurple, size: 20),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            // Notifications List
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 9,
                      horizontal: 6,
                    ),
                    child: Text(
                      "Today",
                      style: TextStyle(
                        color: kPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  ...todayNotifs.map(_tile),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 30, 6, 10),
                    child: Text(
                      "20 Aug, 2025",
                      style: TextStyle(
                        color: kPurpleGray,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  ...prevNotifs.map(_tile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(Map<String, dynamic> n) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xfffaf9fb),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kPurple.withOpacity(0.085),
              borderRadius: BorderRadius.circular(10),
            ),
            width: 36,
            height: 36,
            child: Icon(n['icon'], color: n['color'], size: 23),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        n['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      n['time'],
                      style: TextStyle(fontSize: 12, color: kPurpleGray),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  n['desc'],
                  style: TextStyle(
                    fontSize: 13,
                    color: kPurpleGray,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
