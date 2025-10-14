import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/categories/booking_arrival_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingOptionsScreen extends StatefulWidget {
  @override
  State<BookingOptionsScreen> createState() => _BookingOptionsScreenState();
}

class _BookingOptionsScreenState extends State<BookingOptionsScreen> {
  final List<String> problemOptions = [
    "Power outage in the house/room",
    "Burning smell or sparks from a socket",
    "Circuit breaker tripping repeatedly",
    "Exposed live wires",
    "Short circuit or smoke from appliance",
    "Appliance breakdown",
    "Other",
  ];

  List<bool> selected = [true, false, false, false, false, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 6),
            Row(
              children: [
                SizedBox(width: 14),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/icons/back.svg"),
                ),
                SizedBox(width: 10),
                Text(
                  "Booking",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                ),
              ],
            ),
            SizedBox(height: 22),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 9,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/hero_clean.jpg",
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
                            'Jacob Jone',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Handyman',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '\$12.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        "/visit",
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tell us more about your problem",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            // Problem list
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 18),
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(11),
                    onTap: () {
                      setState(() {
                        selected[index] = !selected[index];
                      });
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                problemOptions[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.5,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color:
                                    selected[index]
                                        ? primaryColor
                                        : Colors.transparent,
                                border: Border.all(
                                  color:
                                      selected[index]
                                          ? primaryColor
                                          : Color(0xFFCAC7D1),
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child:
                                  selected[index]
                                      ? Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                      : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 12),
                itemCount: problemOptions.length,
              ),
            ),
            // Continue button
            Padding(
              padding: EdgeInsets.only(bottom: 18, left: 20, right: 20),
              child: SizedBox(
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
                    context.goTo(BookingArrivalScreen());
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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
