import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RequestTrackingPlacedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Map or Container as background
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFFE0DEEA)),
              child: Stack(
                children: [
                  // Centered icons
                  // Align(
                  //   alignment: Alignment(0, -0.2),
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Container(
                  //         padding: EdgeInsets.all(12),
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           shape: BoxShape.circle,
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.black12,
                  //               blurRadius: 6,
                  //               offset: Offset(0, 1),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Icon(
                  //           Icons.location_pin,
                  //           color: Color(0xFF8152E0),
                  //           size: 32,
                  //         ),
                  //       ),
                  //       SizedBox(height: 14),
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           color: Color(0xFF8152E0),
                  //           shape: BoxShape.circle,
                  //         ),
                  //         padding: EdgeInsets.all(10),
                  //         child: Icon(
                  //           Icons.assignment_turned_in_rounded,
                  //           color: Colors.white,
                  //           size: 23,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Positioned(
                    left: 18,
                    top: 18,
                    child: InkWell(
                      onTap: () {
                        context.goOffAll(MainScreen());
                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, color: Color(0xFF7A7692)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Foreground white card (scrollable with rest)
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                  ), // the white card overlays on the container
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(28),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        children: [
                          SizedBox(height: 18),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Estimated arrival",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFAAA4B7),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "Within 20 mins",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF392B50),
                                  ),
                                ),
                                SizedBox(height: 15),
                                _TrackingStepper(activeStep: 0),
                                SizedBox(height: 4),
                                Text(
                                  "Your request is placed!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF948EA4),
                                  ),
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                          ),
                          // Provider Card
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF322049),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 7,
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(19),
                                  child: Image.asset(
                                    "assets/images/profile.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jerome Bell",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "Electrical",
                                      style: TextStyle(
                                        color: Color(0xFFD1D1E5),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: SvgPicture.asset(
                                    "assets/icons/message-2.svg",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18),
                          // Info
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE8E2ED),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Column(
                              children: [
                                _InfoRow(
                                  icon: "assets/icons/clock.svg",
                                  label: "Today",
                                  value: "at 09:00 Am",
                                ),
                                Divider(
                                  color: Color(0xFFE0D6ED),
                                  thickness: 1,
                                  height: 0,
                                ),
                                _InfoRow(
                                  icon: "assets/icons/dollar-circle.svg",
                                  label: "Amount",
                                  value: "\$16",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/danger.svg"),
                              SizedBox(width: 4),
                              Text(
                                "Report a Problem",
                                style: TextStyle(
                                  color: Color(0xFF7A7692),
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 19),
                          Center(
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFF6F6F9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {
                                  context.goOffAll(MainScreen());
                                },
                                child: Text(
                                  "Cancel Request",
                                  style: TextStyle(
                                    color: Color(0xFFF01055),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 22),
                        ],
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

// Stepper Widget (Fully Connected Steps)
class _TrackingStepper extends StatelessWidget {
  final int activeStep; // For future: which step is done
  const _TrackingStepper({required this.activeStep});
  @override
  Widget build(BuildContext context) {
    final total = 4;
    return Row(
      children: List.generate(total * 2 - 1, (i) {
        if (i.isEven) {
          int step = i ~/ 2;
          bool active = step <= activeStep; // Only first is filled now
          return Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: active ? primaryColor : Color(0xFFE5E2EB),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child:
                active
                    ? Icon(Icons.check, color: Colors.white, size: 18)
                    : Icon(Icons.check, color: Color(0xffB1B1B1), size: 18),
          );
        } else {
          // Line between circles
          int step = i ~/ 2;

          bool active = step <= activeStep; // Only first is filled now

          return Expanded(
            child: Container(
              height: 4,
              color: active ? primaryColor : Color(0xFFE5E2EB),
            ),
          );
        }
      }),
    );
  }
}

// Helper for the info row
class _InfoRow extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF948EA4),
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              color: Color(0xFF392B50),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
