import 'package:fixly/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const kPurple = Color(0xFF635B6A);
const kPurpleGray = Color(0xFFA29EA3);
const kAccentYellow = Color(0xFFDCAA25);
const kBackground = Color(0xFFF9F9F9);

class CategoriesScreen extends StatelessWidget {
  final categories = [
    {'icon': "assets/icons/cleaning.svg", 'label': "Cleaning"},
    {'icon': "assets/icons/electrical.svg", 'label': "Electrical"},
    {'icon': "assets/icons/ac.svg", 'label': "AC"},
  ];
  Widget buildCustomAppBar(
    BuildContext context, {
    String title = 'All Categories',
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

  Widget _buildSearchBar() {
    return InkWell(
      onTap: () {
        print("Tapped");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildCustomAppBar(context),
            SizedBox(height: 24),
            _buildSearchBar(),
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (_) => CategoryDetailsScreen(
                                        selectedCategory: cat['label']!,
                                      ),
                                ),
                              );
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

class SpecialRequestSheet extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 88,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Special Request',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xff231531),
            ),
          ),
          SizedBox(height: 22),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: serviceController,
                  decoration: InputDecoration(
                    hintText: "Enter service name",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black26, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: descController,
                  decoration: InputDecoration(
                    hintText: "Description...",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black26, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 26),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDetailsScreen extends StatefulWidget {
  final String selectedCategory;
  CategoryDetailsScreen({required this.selectedCategory});
  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  List<String> tabs = [
    "Electrical",
    "Painting",
    "Carpentry",
    "Plumbing",
    "Cleaning",
  ];
  int selectedTab = 0;
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
            widget.selectedCategory,
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

  Widget _buildSearchBar() {
    return InkWell(
      onTap: () {
        print("Tapped");
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
                Icon(Icons.bookmark_border, color: kPurpleGray, size: 21),
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
            _buildSearchBar(),
            SizedBox(height: 24),

            // Tab row
            SizedBox(
              height: 34,
              child: ListView.builder(
                itemCount: tabs.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  bool selected = selectedTab == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedTab = index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selected
                                ? kPurple.withOpacity(.12)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: selected ? kPurple : Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
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
