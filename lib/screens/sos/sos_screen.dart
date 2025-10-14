import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/categories/categories_screen.dart';
import 'package:fixly/screens/sos/sos_problem_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const kPurple = Color(0xFF635B6A);
const kPurpleGray = Color(0xFFA29EA3);
const kAccentYellow = Color(0xFFDCAA25);
const kBackground = Color(0xFFF9F9F9);

class SosScreen extends StatelessWidget {
  final categories = [
    {'icon': "assets/icons/cleaning.svg", 'label': "Cleaning"},
    {'icon': "assets/icons/electrical.svg", 'label': "Electrical Failure"},
    {'icon': "assets/icons/ac.svg", 'label': "AC/Heating"},
  ];
  Widget buildCustomAppBar(
    BuildContext context, {
    String title = 'Emergency SOS',
  }) {
    return Container(
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
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(32),
            child: SvgPicture.asset("assets/icons/back.svg"),
          ),
          SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildCustomAppBar(context),
            SizedBox(height: 24),

            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children:
                    categories
                        .map(
                          (cat) => GestureDetector(
                            onTap: () {
                              context.goTo(SosProblemScreen());
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                              margin: const EdgeInsets.all(8),
                              color: kBackground,

                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(cat['icon']!),
                                    Text(cat['label']!),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Material(
                color: Color.fromARGB(255, 219, 208, 230),
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      isScrollControlled: true,
                      builder: (_) => SpecialRequestSheet(),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/magic-star.svg"),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Special Request',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Can't find what you need?\nYou can submit a special request to help us add more services.",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff6F6F6F),
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
