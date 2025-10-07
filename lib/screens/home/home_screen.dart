import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/categories/categories_screen.dart';
import 'package:fixly/screens/notifications/notifications_screen.dart';
import 'package:fixly/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

const kPurple = Color(0xFF635B6A);
const kPurpleGray = Color(0xFFA29EA3);
const kAccentYellow = Color(0xFFDCAA25);
const kBackground = Color(0xFFF9F9F9);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: CircleAvatar(
            radius: 27,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Jonathan',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff231531),
              ),
            ),
            Row(
              children: [
                SvgPicture.asset("assets/icons/location.svg"),
                SizedBox(width: 4),
                Text(
                  'London, UK',
                  style: TextStyle(fontSize: 14, color: kPurpleGray),
                ),
                SizedBox(width: 4),
                SvgPicture.asset("assets/icons/arrow-down.svg"),
              ],
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              context.goTo(NotificationsScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kPurple.withOpacity(0.2), width: 2),
                ),
                child: SvgPicture.asset("assets/icons/notification-bing.svg"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildSearchBar(context),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildCategorySection(context),
            ),
            SizedBox(height: 24),
            // _buildHeroPromoCard(),
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                viewportFraction: 0.9,

                autoPlay: true,
              ),
              items:
                  [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/images/slider_home.png",
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Most Popular',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: kPurple,
                ),
              ),
            ),
            SizedBox(height: 8),
            _buildMostPopularList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goTo(SearchScreen());
      },
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            SizedBox(width: 20),
            SvgPicture.asset(
              "assets/icons/search-normal.svg",
              width: 24,
              height: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for a service ...',
                  hintStyle: TextStyle(color: kPurpleGray, fontSize: 16),
                ),
              ),
            ),
            SvgPicture.asset("assets/icons/setting-4.svg"),
            SizedBox(width: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    final categories = [
      {'icon': "assets/icons/cleaning.svg", 'label': "Cleaning"},
      {'icon': "assets/icons/electrical.svg", 'label': "Electrical"},
      {'icon': "assets/icons/ac.svg", 'label': "AC"},
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'All Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {
                context.goTo(CategoriesScreen());
              },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                'View All',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (_) => CategoryDetailsScreen(
                          selectedCategory:
                              categories[index]['label'].toString(),
                        ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffFAFAFA),
                  border: Border.all(color: Color(0xffEEEEEE)),
                ),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(categories[index]["icon"].toString()),
                    Text(categories[index]["label"].toString()),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Widget _buildHeroPromoCard() {
  //   return SizedBox(
  //     height: 140,
  //     child: Stack(
  //       children: [
  //         Container(
  //           width: double.infinity,
  //           height: 140,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(16),
  //             image: DecorationImage(
  //               image: AssetImage('assets/cleaning.jpg'),
  //               fit: BoxFit.cover,
  //             ),
  //             boxShadow: [
  //               BoxShadow(color: kPurpleGray.withOpacity(0.14), blurRadius: 12),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           height: 140,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(16),
  //             gradient: LinearGradient(
  //               colors: [Colors.black.withOpacity(0.40), Colors.transparent],
  //               begin: Alignment.centerLeft,
  //               end: Alignment.centerRight,
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           left: 20,
  //           top: 36,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Up to',
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 17,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               Row(
  //                 children: [
  //                   Text(
  //                     '40% OFF',
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 24,
  //                       fontWeight: FontWeight.w700,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Text(
  //                 'on the cleaning service',
  //                 style: TextStyle(color: Colors.white, fontSize: 15),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildMostPopularList() {
    final items = [
      {
        'img': 'assets/images/hero_clean.jpg',
        'title': 'Hero Clean',
        'category': 'Cleaning',
        'rating': 4.9,
      },
      {
        'img': 'assets/images/renner_group.jpg',
        'title': 'Renner Group',
        'category': 'Plumbing',
        'rating': 4.9,
      },
    ];
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            width: context.width() * .5,
            margin: EdgeInsetsDirectional.only(start: index == 0 ? 16 : 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xffEEEEEE)),
              boxShadow: [
                BoxShadow(
                  color: kPurpleGray.withOpacity(0.12),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    item['img']!.toString(),
                    height: 88,
                    width: context.width() * .5,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                  child: Text(
                    item['title']!.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  child: Text(
                    item['category']!.toString(),
                    style: TextStyle(fontSize: 13, color: kPurpleGray),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 16, color: kAccentYellow),
                      SizedBox(width: 4),
                      Text(
                        '${item['rating']}',
                        style: TextStyle(fontSize: 13, color: kPurple),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
