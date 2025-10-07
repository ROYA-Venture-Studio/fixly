import 'package:fixly/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const kPurple = Color(0xFF635B6A);
const kPurpleGray = Color(0xFFA29EA3);
const kAccentYellow = Color(0xFFDCAA25);
const kBackground = Color(0xFFF9F9F9);

class SavedTechniciansScreen extends StatefulWidget {
  const SavedTechniciansScreen({super.key});
  @override
  State<SavedTechniciansScreen> createState() => _SavedTechniciansScreenState();
}

class _SavedTechniciansScreenState extends State<SavedTechniciansScreen> {
  Widget buildCustomAppBar(BuildContext context) {
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
            "Saved Technicians",
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

  Widget _serviceCard({
    required String image,
    required String title,
    required String price,
    required String rating,
    required String reviews,
    bool isPopular = false,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Color(0xffEEEEEE)),
      ),
      elevation: 0,
      color: Color(0xffFAFAFA),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0), // Padding للصورة نفسها
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      height: 96,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (isPopular)
                  Positioned(
                    left: 16,
                    top: 16,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 239, 223),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "Popular",
                        style: TextStyle(
                          color: Color.fromARGB(255, 235, 138, 33),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.star, size: 15, color: kAccentYellow),
                SizedBox(width: 2),
                Text(rating, style: TextStyle(fontSize: 13, color: kPurple)),
                SizedBox(width: 2),
                Text(
                  '| $reviews reviews',
                  style: TextStyle(fontSize: 12, color: kPurpleGray),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: kPurple,
                  ),
                ),
                Spacer(),
                Icon(Icons.bookmark, color: primaryColor, size: 21),
              ],
            ),
          ],
        ),
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

            // Service cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.9,
                  children: [
                    _serviceCard(
                      image: 'assets/images/renner_group.jpg',
                      title: 'Electroplace',
                      price: '\$12/hr',
                      rating: '4.9',
                      reviews: '24',
                      isPopular: true,
                    ),
                    _serviceCard(
                      image: 'assets/images/renner_group.jpg',
                      title: 'Electroplace',
                      price: '\$12/hr',
                      rating: '4.9',
                      reviews: '24',
                      isPopular: false,
                    ),
                    _serviceCard(
                      image: 'assets/images/renner_group.jpg',
                      title: 'Electroplace',
                      price: '\$12/hr',
                      rating: '4.9',
                      reviews: '24',
                      isPopular: false,
                    ),
                    _serviceCard(
                      image: 'assets/images/renner_group.jpg',
                      title: 'Electroplace',
                      price: '\$12/hr',
                      rating: '4.9',
                      reviews: '24',
                      isPopular: true,
                    ),
                    _serviceCard(
                      image: 'assets/images/renner_group.jpg',
                      title: 'Electroplace',
                      price: '\$12/hr',
                      rating: '4.9',
                      reviews: '24',
                      isPopular: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
