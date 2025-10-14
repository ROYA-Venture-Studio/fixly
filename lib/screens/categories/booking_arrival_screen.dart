import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'request_tracking_screen.dart';

class BookingArrivalScreen extends StatefulWidget {
  @override
  State<BookingArrivalScreen> createState() => _BookingArrivalScreenState();
}

class _BookingArrivalScreenState extends State<BookingArrivalScreen> {
  String selectedAddress = "4140 Parker Rd. Allentown";
  String selectedTime = "Wednesday, 13 Jan (09:00 AM)";
  String selectedPayment = "Cash";
  bool useWallet = false;

  Future<void> showAddressSheet() async {
    String? result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddressSheet(selected: selectedAddress),
    );
    if (result != null) setState(() => selectedAddress = result);
  }

  Future<void> showTimeOptions() async {
    final option = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(100, 200, 100, 0),
      items: [
        PopupMenuItem(value: 'Now', child: Text('Now (20 min)')),
        PopupMenuItem(value: 'Select', child: Text('Select Date and Time')),
      ],
    );
    if (option == 'Select') {
      String? dateResult = await showModalBottomSheet<String>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => DateTimeSheet(),
      );
      if (dateResult != null) setState(() => selectedTime = dateResult);
    } else if (option == 'Now') {
      setState(() => selectedTime = "Now (20 min)");
    }
  }

  Future<void> showPaymentOptions() async {
    final option = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(100, 270, 100, 0),
      items: [
        PopupMenuItem(value: 'Cash', child: Text('Cash')),
        PopupMenuItem(value: 'Online', child: Text('Online Payment')),
        PopupMenuItem(value: 'Apple pay', child: Text('Apple pay')),
      ],
    );
    if (option != null) setState(() => selectedPayment = option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: ListView(
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset("assets/icons/back.svg"),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Booking',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Text("Arrival Time"),
              SectionTile(
                icon: "assets/icons/calendar-2.svg",
                title: selectedTime,
                onTap: showTimeOptions,
                showArrow: true,
              ),
              Divider(color: Color(0xffEEEEEE)),
              SectionTile(
                icon: "assets/icons/location2.svg",
                title: selectedAddress,
                onTap: showAddressSheet,
                showArrow: true,
              ),
              Divider(color: Color(0xffEEEEEE)),
              Padding(
                padding: EdgeInsets.only(top: 14, bottom: 4),
                child: Text(
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ),
              SwitchListTile(
                title: Text(
                  "Use wallet balance",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                value: useWallet,
                subtitle: Text(
                  "\$0.00",
                  style: TextStyle(color: Color(0xff6F6F6F)),
                ),

                onChanged: (v) => setState(() => useWallet = v),
                secondary: SvgPicture.asset("assets/icons/payments_nav.svg"),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 1,
                ),
              ),
              SectionTile(
                icon: "assets/icons/dollar-circle.svg",
                title: selectedPayment,
                onTap: showPaymentOptions,
                showArrow: true,
              ),

              Divider(color: Color(0xffEEEEEE)),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 6),
                child: Text(
                  "Special Notes",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              Container(
                height: 72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFE4E3ED)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Description...",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18),

              Divider(color: Color(0xffEEEEEE)),

              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  "Promo Code",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              SizedBox(height: 14),

              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFE4E3ED)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type your promo code here",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xffDCDCDC),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 13,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    TextButton(onPressed: () {}, child: Text("Apply")),
                  ],
                ),
              ),

              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Service Fee",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    "\$12",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                height: 51,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    context.goOffAll(RequestTrackingPlacedScreen());
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

// List tile for sections
class SectionTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool showArrow;
  const SectionTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.showArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.5),
      ),
      trailing:
          showArrow ? Icon(Icons.chevron_right, color: Colors.black38) : null,
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 1),
    );
  }
}

// Address Bottom Sheet
class AddressSheet extends StatelessWidget {
  final String selected;
  AddressSheet({required this.selected});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(19)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 37,
              height: 3,
              margin: EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: Color(0xFFD9D5DD),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Row(
              children: [
                Text(
                  "Address",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/add-circle.svg"),
                    Text(
                      "Add Address",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            ...[
              "4140 Parker Rd. Allentown",
              "6391 Elgin St. Celina, Delaware 10299",
            ].map(
              (addr) => ListTile(
                leading: SvgPicture.asset("assets/icons/location2.svg"),
                title: Text(
                  addr,
                  style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600),
                ),
                trailing:
                    addr == selected
                        ? SvgPicture.asset("assets/icons/selected.svg")
                        : null,
                onTap: () => Navigator.pop(context, addr),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Color(0xFF6F6F6F),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Select Date & Time Sheet
class DateTimeSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int selectedDayIdx = 3; // Wed 13 sample
    int selectedTimeIdx = 1; // 09:00 sample
    List<String> days = [
      "Sun 10",
      "Mon 11",
      "Tue 12",
      "Wed 13",
      "Thu 14",
      "Fri 15",
      "Sat 16",
    ];
    List<String> times = ["08 : 00", "09 : 00", "10 : 00", "11 : 00"];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(19)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 37,
              height: 3,
              margin: EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: Color(0xFFD9D5DD),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              "Select Date",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.chevron_left, color: primaryColor),
                Text(
                  "January 2025",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Icon(Icons.chevron_right, color: primaryColor),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(days.length, (i) {
                bool sel = i == selectedDayIdx;
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: sel ? primaryColor : Color(0xFFF6F4FB),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      child: Text(
                        days[i].split(' ')[0],
                        style: TextStyle(
                          color:
                              sel
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.45),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      days[i].split(' ')[1],
                      style: TextStyle(
                        color:
                            sel ? primaryColor : Colors.black.withOpacity(0.45),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 13),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Time",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "Morning",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Icon(Icons.keyboard_arrow_down, color: Color(0xFF8152E0)),
              ],
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(times.length, (i) {
                bool sel = i == selectedTimeIdx;
                return Container(
                  decoration: BoxDecoration(
                    color: sel ? primaryColor : Color(0xFFF6F4FB),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 11),
                  child: Text(
                    times[i],
                    style: TextStyle(
                      color:
                          sel ? Colors.white : Colors.black.withOpacity(0.45),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 19),
            SizedBox(
              width: double.infinity,
              height: 47,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed:
                    () =>
                        Navigator.pop(context, "Wednesday, 13 Jan (09:00 AM)"),
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
