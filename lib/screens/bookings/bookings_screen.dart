import 'package:fixly/core/app_colors.dart';
import 'package:flutter/material.dart';

// Model for Booking Item
class BookingItem {
  final String imageUrl;
  final String name;
  final String type;
  final String datetime;
  final String arrivalTime;
  final String fee;
  final String? statusLabel;
  final Color? statusColor;
  final BookingTab tab;

  BookingItem({
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.datetime,
    required this.fee,
    required this.tab,
    this.arrivalTime = "",
    this.statusLabel,
    this.statusColor,
  });
}

enum BookingTab { ongoing, completed, cancelled }

class BookingsScreen extends StatefulWidget {
  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int selectedTab = 0;
  final List<BookingItem> allBookings = [
    // Ongoing
    BookingItem(
      imageUrl: "assets/images/hero_clean.jpg",
      name: "Jacob Jone",
      type: "Handyman",
      datetime: "23 Sep, 2025 3:00 PM",
      arrivalTime: "Estimated arrival 6:30 pm",
      fee: "\$12.00/visit",
      statusLabel: "Approved",
      statusColor: Color(0xFF51B77D),
      tab: BookingTab.ongoing,
    ),
    BookingItem(
      imageUrl: "assets/images/hero_clean.jpg",
      name: "Jacob Jone",
      type: "Electrical",
      datetime: "23 Sep, 2025 3:00 PM",
      arrivalTime: "Estimated arrival 8:00 pm",
      fee: "\$12.00/visit",
      statusLabel: "Pending",
      statusColor: Color(0xFFF3BE39),
      tab: BookingTab.ongoing,
    ),
    BookingItem(
      imageUrl: "assets/images/hero_clean.jpg",
      name: "Jacob Jone",
      type: "Electrical",
      datetime: "23 Sep, 2025 3:00 PM",
      arrivalTime: "Estimated arrival 8:00 pm",
      fee: "\$12.00/visit",
      statusLabel: "On The Way",
      statusColor: Color(0xFF6C53E2),
      tab: BookingTab.ongoing,
    ),
    // Completed
    BookingItem(
      imageUrl: "assets/images/hero_clean.jpg",
      name: "Jacob Jone",
      type: "Handyman",
      datetime: "23 Sep, 2025 3:00 PM",
      fee: "\$12.00/visit",
      tab: BookingTab.completed,
    ),
    BookingItem(
      imageUrl: "assets/images/hero_clean.jpg",
      name: "Jacob Jone",
      type: "Electrical",
      datetime: "23 Sep, 2025 3:00 PM",
      fee: "\$12.00/visit",
      tab: BookingTab.completed,
    ),
    BookingItem(
      imageUrl: "assets/images/hero_clean.jpg",
      name: "Jacob Jone",
      type: "Electrical",
      datetime: "23 Sep, 2025 3:00 PM",
      fee: "\$12.00/visit",
      tab: BookingTab.completed,
    ),
    // Cancelled
    BookingItem(
      imageUrl: "assets/images/hero_clean.jpg",
      name: "Jacob Jone",
      type: "Handyman",
      datetime: "23 Sep, 2025 3:00 PM",
      fee: "\$12.00/visit",
      tab: BookingTab.cancelled,
    ),
    BookingItem(
      imageUrl: "assets/images/hero_clean.jpg",
      name: "Jacob Jone",
      type: "Electrical",
      datetime: "23 Sep, 2025 3:00 PM",
      fee: "\$12.00/visit",
      tab: BookingTab.cancelled,
    ),
    BookingItem(
      imageUrl: "assets/images/hero_clean.jpg",
      name: "Jacob Jone",
      type: "Electrical",
      datetime: "23 Sep, 2025 3:00 PM",
      fee: "\$12.00/visit",
      tab: BookingTab.cancelled,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered =
        allBookings.where((b) => b.tab.index == selectedTab).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, top: 12, bottom: 24),
              child: Row(
                children: [
                  Text(
                    "My Bookings",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19),
              child: Row(
                children: [
                  _tabButton("Ongoing", 0),
                  SizedBox(width: 9),
                  _tabButton("Completed", 1),
                  SizedBox(width: 9),
                  _tabButton("Cancelled", 2),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemCount: filtered.length,
                itemBuilder: (_, idx) {
                  final booking = filtered[idx];
                  if (selectedTab == 0) {
                    // Ongoing Tab
                    return _BookingOngoingCard(item: booking);
                  } else if (selectedTab == 1) {
                    // Completed Tab
                    return _BookingCompletedCard(item: booking);
                  } else {
                    // Cancelled Tab
                    return _BookingCancelledCard(item: booking);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String text, int tabIndex) {
    bool selected = selectedTab == tabIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = tabIndex),
        child: Container(
          height: 39,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? Color(0xFFE8E2ED) : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected ? Color(0xFFD8D2E9) : Color(0xFFEAE8F0),
              width: 1.3,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: selected ? primaryColor : Color(0xFFBDBCC7),
            ),
          ),
        ),
      ),
    );
  }
}

class _BookingOngoingCard extends StatelessWidget {
  final BookingItem item;
  const _BookingOngoingCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.imageUrl,
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      item.type,
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                  decoration: BoxDecoration(
                    color: item.statusColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    item.statusLabel ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.arrivalTime,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),

                Text(
                  item.fee,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Divider(color: Color(0xffEEEEEE)),
            SizedBox(height: 11),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 41,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF2F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cancel Request",
                        style: TextStyle(
                          color: Color(0xFFF3859A),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 41,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.event, color: Colors.white, size: 18),
                      label: Text(
                        "Reschedule",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingCompletedCard extends StatelessWidget {
  final BookingItem item;
  const _BookingCompletedCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.imageUrl,
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      item.type,
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.datetime,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),
                Text(
                  item.fee,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 11),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 41,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        showLeaveReviewSheet(
                          context,
                          "assets/images/hero_clean.jpg",
                          "Jacob Jone",
                          "Handyman",
                        );
                      },
                      child: Text(
                        "Leave Review",
                        style: TextStyle(
                          color: Color(0xFF8D8889),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 41,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.event, color: Colors.white, size: 18),
                      label: Text(
                        "Re-Book",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingCancelledCard extends StatelessWidget {
  final BookingItem item;
  const _BookingCancelledCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.imageUrl,
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      item.type,
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.datetime,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),
                Text(
                  item.fee,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 11),
            SizedBox(
              width: double.infinity,
              height: 41,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.event, color: Colors.white, size: 18),
                  label: Text(
                    "Re-Book",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Call this wherever needed:
// showLeaveReviewSheet(context, imageUrl, name, type);

Future<void> showLeaveReviewSheet(
  BuildContext context,
  String userImage,
  String userName,
  String userType,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (_) => DraggableScrollableSheet(
          initialChildSize: 0.55,
          maxChildSize: 0.9,
          minChildSize: 0.35,
          expand: false,
          builder:
              (_, controller) => _ReviewSheet(
                imageUrl: userImage,
                name: userName,
                type: userType,
              ),
        ),
  );
}

class _ReviewSheet extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String type;

  const _ReviewSheet({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.type,
  });

  @override
  State<_ReviewSheet> createState() => _ReviewSheetState();
}

class _ReviewSheetState extends State<_ReviewSheet> {
  int selectedStars = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      child: SingleChildScrollView(
        controller: PrimaryScrollController.of(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 34,
                height: 4,
                margin: EdgeInsets.only(bottom: 19),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D5DD),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Leave a Review",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Color(0xFF3A284E),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: Color(0xFF948EA4), size: 28),
                ),
              ],
            ),
            SizedBox(height: 19),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F4FB),
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.asset(
                      widget.imageUrl,
                      width: 46,
                      height: 46,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.type,
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (i) => GestureDetector(
                  onTap: () => setState(() => selectedStars = i + 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      Icons.star,
                      size: 42,
                      color:
                          i < selectedStars
                              ? Color(0xFFF6D060)
                              : Color(0xFFE6E1EF),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 19),
            Text(
              "Write your review",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(height: 7),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F4FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _controller,
                minLines: 4,
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "How was your experience?...",
                  hintStyle: TextStyle(
                    color: Color(0xFF948EA4),
                    fontSize: 14.3,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
            ),
            SizedBox(height: 27),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  // Handle submit logic here if needed
                  Navigator.pop(context);
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
