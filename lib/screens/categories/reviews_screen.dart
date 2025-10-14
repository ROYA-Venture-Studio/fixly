import 'package:fixly/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Review Model
class CustomerReview {
  final String name;
  final String date;
  final int stars;
  final String title;
  final String body;
  final bool verified;

  CustomerReview({
    required this.name,
    required this.date,
    required this.stars,
    required this.title,
    required this.body,
    required this.verified,
  });
}

class ReviewsScreen extends StatelessWidget {
  final List<CustomerReview> reviews = List.generate(
    4,
    (i) => CustomerReview(
      name: "David Backham",
      date: "May 09, 2025",
      stars: 5,
      title: "Very good service",
      body:
          "This was my first time I've booked this service. The work was very clear!",
      verified: true,
    ),
  );
  final List<Map<String, dynamic>> stats = [
    {"stars": 5, "percent": 80},
    {"stars": 4, "percent": 15},
    {"stars": 3, "percent": 3},
    {"stars": 2, "percent": 2},
    {"stars": 1, "percent": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 14),
          children: [
            SizedBox(height: 12),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/icons/back.svg"),
                ),
                SizedBox(width: 13),
                Text(
                  "Customer Reviews",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                ),
              ],
            ),
            SizedBox(height: 21),
            Row(
              children: [
                Icon(Icons.star, color: Color(0xFFF6D060), size: 32),
                SizedBox(width: 6),
                Text(
                  "4.9",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                    color: Color(0xFF392B50),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Write a review",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            ...stats.map(
              (s) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.2),
                child: Row(
                  children: [
                    SizedBox(
                      width: 18,
                      child: Icon(
                        Icons.star,
                        color: Color(0xFFF6D060),
                        size: 16,
                      ),
                    ),
                    Text(
                      '${s["stars"]}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 14,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F0F7),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: s["percent"] / 100.0,
                            child: Container(
                              height: 14,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    SizedBox(
                      width: 34,
                      child: Text(
                        "${s["percent"]}%",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 13),
            ...reviews.map(
              (r) => Container(
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        r.stars,
                        (i) => Icon(
                          Icons.star,
                          color: Color(0xFFF6D060),
                          size: 19,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      r.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          r.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                            fontSize: 14.3,
                          ),
                        ),
                        if (r.verified)
                          SvgPicture.asset("assets/icons/verify.svg"),
                        SizedBox(width: 4),
                        Text(
                          r.date,
                          style: TextStyle(
                            color: Color(0xFF948EA4),
                            fontSize: 13.3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      r.body,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.78),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
