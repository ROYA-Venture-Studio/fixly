import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/categories/booking_confirmation_screen.dart';
import 'package:fixly/screens/categories/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceDetailsScreen extends StatefulWidget {
  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  int _currentPage = 0;
  final List<String> images = [
    'assets/images/renner_group.jpg',
    'assets/images/onboarding1.jpg',
    'assets/images/onboarding2.jpg',
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4FB),
      body: SafeArea(
        child: Column(
          children: [
            // Slider with indicators
            Container(
              height: 220,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: images.length,
                    onPageChanged: (val) => setState(() => _currentPage = val),
                    itemBuilder:
                        (_, idx) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(images[idx]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  ),
                  Positioned(
                    top: 22,
                    left: 12,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/icons/back.svg"),
                    ),
                  ),
                  Positioned(
                    bottom: 28,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        images.length,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          width: _currentPage == index ? 10 : 7,
                          height: _currentPage == index ? 10 : 7,
                          decoration: BoxDecoration(
                            color:
                                _currentPage == index
                                    ? Color(0xFF8152E0)
                                    : Colors.white70,
                            shape: BoxShape.circle,
                            boxShadow: [
                              if (_currentPage == index)
                                BoxShadow(
                                  color: Color(0xFF8152E0).withOpacity(0.35),
                                  blurRadius: 4,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Card content
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      // Title Row
                      Row(
                        children: [
                          Text(
                            'Electroplace',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 21,
                            ),
                          ),
                          SizedBox(width: 4),
                          SvgPicture.asset("assets/icons/verify.svg"),
                          Spacer(),
                          SvgPicture.asset(
                            "assets/icons/send_message_white.svg",
                          ),
                          SizedBox(width: 10),
                          SvgPicture.asset("assets/icons/bookmark.svg"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            'Open',
                            style: TextStyle(
                              color: Color(0xFF53C781),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            ' • Closes 10 PM',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      // Info Row
                      SizedBox(height: 14),
                      Divider(),
                      SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: _InfoColumn(
                              label: "Completed Tasks",
                              value: "170",
                            ),
                          ),
                          _DividerVertical(),
                          Expanded(
                            child: _InfoColumn(
                              label: "Rating",
                              value: "4.9",
                              icon: Icons.star,
                              iconColor: Color(0xFFF6D060),
                            ),
                          ),
                          _DividerVertical(),
                          Expanded(
                            child: _InfoColumn(
                              label: "Price/hr",
                              value: "\$12",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(),
                      SizedBox(height: 16),
                      // Description
                      Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Our certified electricians handle everything from fixing wiring issues to installing new appliances—always following the highest safety standards.",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.67),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 32),
                      // Services tags
                      Text(
                        "Available Services",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 7,
                        children: [
                          _ServiceTag('Wiring'),
                          _ServiceTag('Switches'),
                          _ServiceTag('Electrical troubleshooting'),
                          _ServiceTag('Lighting'),
                          _ServiceTag('Ceiling fan installation'),
                          _ServiceTag('Sockets'),
                        ],
                      ),
                      SizedBox(height: 18),
                      // Reviews
                      Row(
                        children: [
                          Text(
                            "Reviews",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              context.goTo(ReviewsScreen());
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      _ReviewCard(),
                      SizedBox(height: 12),
                      _ReviewCard(),
                      SizedBox(height: 50), // For spacing above button
                    ],
                  ),
                ),
              ),
            ),
            // Book button
            Padding(
              padding: const EdgeInsets.only(
                bottom: 18,
                left: 20,
                right: 20,
                top: 0,
              ),
              child: SizedBox(
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
                    context.goTo(BookingOptionsScreen());
                  },
                  child: Text(
                    'Book Now',
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

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;

  _InfoColumn({
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.5,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        SizedBox(height: 3),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(icon, size: 18, color: iconColor ?? Colors.black54),
            if (icon != null) SizedBox(width: 3),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DividerVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.5,
      height: 32,
      margin: EdgeInsets.symmetric(horizontal: 9),
      color: Color(0xFFE4E3ED),
    );
  }
}

class _ServiceTag extends StatelessWidget {
  final String label;
  _ServiceTag(this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Color(0xFFE8E2ED),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: TextStyle(color: Color(0xFF5C4178), fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF8F6FB),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFDFD6EC).withOpacity(0.18),
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star, color: Color(0xFFDDAD26), size: 18),
              SizedBox(width: 2),
              Icon(Icons.star, color: Color(0xFFDDAD26), size: 18),
              SizedBox(width: 2),
              Icon(Icons.star, color: Color(0xFFDDAD26), size: 18),
              SizedBox(width: 2),
              Icon(Icons.star, color: Color(0xFFDDAD26), size: 18),
              SizedBox(width: 2),
              Icon(Icons.star, color: Color(0xFFDDAD26), size: 18),
            ],
          ),
          SizedBox(height: 6),
          Text(
            'Very good service',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Text(
                'David Backham',
                style: TextStyle(fontSize: 12.6, color: primaryColor),
              ),
              Text(
                '  |  May 09, 2025',
                style: TextStyle(
                  fontSize: 12.6,
                  color: Colors.black.withOpacity(0.63),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            "This was my first time I've booked this service.",
            style: TextStyle(
              fontSize: 14.2,
              color: Colors.black.withOpacity(0.82),
            ),
          ),
        ],
      ),
    );
  }
}
