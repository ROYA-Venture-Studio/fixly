import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const kPurple = Color(0xFF635B6A);
const kPurpleGray = Color(0xFFA29EA3);

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> recent = ["Hero Clean", "Renner Group", "Electro Master"];

  Widget _buildSearchBar(BuildContext context) {
    return Container(
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
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for a service ...',
                hintStyle: TextStyle(color: kPurpleGray, fontSize: 16),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.goTo(FilterScreen());
            },
            child: SvgPicture.asset("assets/icons/setting-4.svg"),
          ),
          SizedBox(width: 18),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar Row
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: primaryColor, size: 15),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Search",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: kPurple,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            _buildSearchBar(context),
            // Search Input
            SizedBox(height: 18),

            // Recent + Clear All
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text("Recent", style: TextStyle(fontWeight: FontWeight.w600)),
                  Spacer(),
                  if (recent.isNotEmpty)
                    GestureDetector(
                      onTap: () => setState(() => recent.clear()),
                      child: Text(
                        "Clear All",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Recent list
            ...recent.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    Expanded(child: Text(e, style: TextStyle(fontSize: 15))),
                    IconButton(
                      icon: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 196, 196, 196),
                        radius: 10,
                        child: Icon(Icons.close, size: 10, color: kPurpleGray),
                      ),
                      onPressed: () => setState(() => recent.remove(e)),
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

class FilterScreen extends StatefulWidget {
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Expand status
  bool catExpanded = false;
  bool ratingExpanded = false;
  bool sortExpanded = false;

  // Data
  List<String> categories = [
    "Electrical",
    "Painting",
    "Carpentry",
    "Plumbing",
    "Cleaning",
    "Shifting",
    "Appliance",
    "AC/Heating",
    "Handyman",
  ];

  List<int> ratings = [5, 4, 3, 2, 1];

  List<String> sortOptions = [
    "Price (low → high)",
    "Price (high → low)",
    "Rating (high → low)",
    "Rating (low → high)",
  ];

  // Selection status
  List<bool> catSelected = List.filled(9, false);
  List<bool> ratingSelected = List.filled(5, false);
  List<bool> sortSelected = List.filled(4, false);

  RangeValues _priceRange = const RangeValues(5, 83);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            // Header
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.close, color: primaryColor, size: 20),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  "Filter",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kPurple,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),

            // Category Expandable
            _filterExpandable(
              "Category",
              catExpanded,
              () => setState(() => catExpanded = !catExpanded),
              ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:
                    (ctx, i) => CheckboxListTile(
                      value: catSelected[i],
                      onChanged:
                          (v) => setState(() => catSelected[i] = v ?? false),
                      title: Text(
                        categories[i],
                        style: TextStyle(fontSize: 15),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      activeColor: kPurple,
                      contentPadding: EdgeInsets.zero,
                    ),
              ),
            ),

            // Date & Time
            SizedBox(height: 10),
            Text(
              "Date & Time",
              style: TextStyle(color: kPurple, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 46,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kPurple.withOpacity(0.13)),
                    ),
                    child: Row(
                      children: [
                        Text("DD/MM/YYYY", style: TextStyle(fontSize: 15)),
                        Spacer(),
                        SvgPicture.asset("assets/icons/calendar-2.svg"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 46,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kPurple.withOpacity(0.13)),
                    ),
                    child: Row(
                      children: [
                        Text("00:00", style: TextStyle(fontSize: 15)),
                        Spacer(),
                        SvgPicture.asset("assets/icons/calendar-2.svg"),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Rating Expandable
            SizedBox(height: 18),
            _filterExpandable(
              "Rating",
              ratingExpanded,
              () => setState(() => ratingExpanded = !ratingExpanded),
              ListView.builder(
                itemCount: ratings.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:
                    (ctx, i) => CheckboxListTile(
                      value: ratingSelected[i],
                      onChanged:
                          (v) => setState(() => ratingSelected[i] = v ?? false),
                      title: Row(
                        children: [
                          ...List.generate(
                            ratings[i],
                            (index) => Icon(Icons.star, color: Colors.amber),
                          ),
                        ],
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      activeColor: kPurple,
                      contentPadding: EdgeInsets.zero,
                    ),
              ),
            ),

            // Price Range
            SizedBox(height: 10),
            Text(
              "Price Range",
              style: TextStyle(color: kPurple, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: kPurple.withOpacity(0.08)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  RangeSlider(
                    min: 5,
                    max: 83,
                    values: _priceRange,
                    divisions: 20,
                    activeColor: kPurple,
                    inactiveColor: kPurple.withOpacity(0.18),
                    onChanged:
                        (RangeValues v) => setState(() => _priceRange = v),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '\$${_priceRange.start.round()}',
                          style: TextStyle(
                            color: kPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '\$${_priceRange.end.round()}',
                          style: TextStyle(
                            color: kPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Sort Expandable
            SizedBox(height: 18),
            _filterExpandable(
              "Sort by",
              sortExpanded,
              () => setState(() => sortExpanded = !sortExpanded),
              ListView.builder(
                itemCount: sortOptions.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:
                    (ctx, i) => CheckboxListTile(
                      value: sortSelected[i],
                      onChanged:
                          (v) => setState(() => sortSelected[i] = v ?? false),
                      title: Text(
                        sortOptions[i],
                        style: TextStyle(fontSize: 15),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      activeColor: kPurple,
                      contentPadding: EdgeInsets.zero,
                    ),
              ),
            ),
            SizedBox(height: 24),

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
                  "Apply",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Clear Filters",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterExpandable(
    String title,
    bool expanded,
    VoidCallback onTap,
    Widget list,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              color: Color(0xffFAFAFA),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: kPurple.withOpacity(0.13)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: kPurple,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: Duration(milliseconds: 160),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: kPurple,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.only(left: 6, top: 10),
            child: list,
          ),
      ],
    );
  }
}
