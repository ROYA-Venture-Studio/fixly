import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/addresses/address_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  bool isEditMode = false;

  final addresses = [
    {
      'icon': 'assets/icons/home_address.svg',
      'label': 'Home',
      'address': '4140 Parker Rd. Allentown',
      'isDefault': true,
    },
    {
      'icon': 'assets/icons/office_address.svg',
      'label': 'Office',
      'address': '6391 Elgin St. Celina, Delaware 10299',
      'isDefault': false,
    },
    {
      'icon': 'assets/icons/fav_address.svg',
      'label': 'Favourite',
      'address': '6391 Elgin St. Celina, Delaware 10299',
      'isDefault': false,
    },
  ];
  Widget buildCustomAppBar({String title = 'All Categories'}) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom App Bar
            buildCustomAppBar(title: "My Addresses"),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saved Addresses',
                    style: TextStyle(
                      color: Color(0xFFA29EA3),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isEditMode = !isEditMode;
                      });
                    },
                    child: Text(
                      isEditMode ? 'Done' : 'Edit',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: addresses.length,
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = addresses[index];
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Custom SVG icons, replace with SvgPicture.asset if you use SVGs for full match
                              SvgPicture.asset(item['icon'].toString()),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['label'].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Color(0xFF231531),
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      item['address'].toString(),
                                      style: TextStyle(
                                        color: Color(0xFFA29EA3),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (item['isDefault'] == true)
                                Padding(
                                  padding: EdgeInsets.only(top: 2, right: 2),
                                  child: SvgPicture.asset(
                                    "assets/icons/selected.svg",
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    if (isEditMode)
                      Padding(
                        padding: EdgeInsets.only(left: 6, top: 2),
                        child: GestureDetector(
                          onTap: () {
                            // delete logic here
                          },
                          child: SvgPicture.asset("assets/icons/trash.svg"),
                        ),
                      ),
                  ],
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(32),
              child: GestureDetector(
                onTap: () {
                  context.goTo(AddressDetailsScreen());
                },
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/add-circle.svg"),
                    SizedBox(width: 7),
                    Text(
                      "Add New Address",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
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
