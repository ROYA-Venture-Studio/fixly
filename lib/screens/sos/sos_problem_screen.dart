import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/categories/booking_arrival_screen.dart';
import 'package:fixly/screens/categories/request_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SosProblemScreen extends StatefulWidget {
  @override
  State<SosProblemScreen> createState() => _SosProblemScreenState();
}

class _SosProblemScreenState extends State<SosProblemScreen> {
  final List<String> problemOptions = [
    "Power outage in the house/room",
    "Burning smell or sparks from a socket",
    "Circuit breaker tripping repeatedly",
    "Exposed live wires",
    "Short circuit or smoke from appliance",
    "Appliance breakdown",
    "Other",
  ];

  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    "Electrical",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ],
              ),
              SizedBox(height: 22),

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
              RadioGroup<String>(
                groupValue: selected,
                onChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(11),
                      child: Container(
                        height:
                            selected == "Other" &&
                                    selected == problemOptions[index]
                                ? 170
                                : 48,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
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
                                Radio<String>(value: problemOptions[index]),
                              ],
                            ),
                            if (selected == "Other" &&
                                selected == problemOptions[index])
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text("Description"),
                                  ),
                                  SizedBox(height: 12),
                                  Container(
                                    height: 72,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Color(0xFFE4E3ED),
                                      ),
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
                                ],
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
                      context.goTo(RequestTrackingPlacedScreen());
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
      ),
    );
  }
}
