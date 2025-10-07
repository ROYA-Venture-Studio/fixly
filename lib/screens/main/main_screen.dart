import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/home/home_screen.dart';
import 'package:fixly/screens/sos/sos_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bookings/bookings_screen.dart';
import '../menu/menu_screen.dart';
import '../payments/payments_screen.dart';

const kPurple = Color(0xFF635B6A);
const kPurpleGray = Color(0xFFA29EA3);
const kAccentYellow = Color(0xFFDCAA25);
const kBackground = Color(0xFFF9F9F9);

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    BookingsScreen(),
    Container(),
    PaymentsScreen(),
    MenuScreen(),
  ];

  void _onNavTap(int index) {
    if (index == 2) return; // Center FAB handled by FAB onPressed
    setState(() {
      _currentIndex = index;
    });
  }

  void _openSosScreen() {
    context.goTo(SosScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _BottomNavBar(
        selected: _currentIndex,
        onSelect: _onNavTap,
      ),
      floatingActionButton: CircleAvatar(
        radius: 32,
        backgroundColor: kAccentYellow,
        child: IconButton(
          icon: SvgPicture.asset("assets/icons/call_nav.svg"),
          onPressed: _openSosScreen,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/// 5-item bottom nav bar with FAB
class _BottomNavBar extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onSelect;

  const _BottomNavBar({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: SizedBox(
        height: 68,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(context, "assets/icons/home_nav.svg", 'Home', 0),
            _buildNavItem(
              context,
              "assets/icons/booking_nav.svg",
              'Bookings',
              1,
            ),
            const SizedBox(width: 56), // Central FAB space
            _buildNavItem(
              context,
              "assets/icons/payments_nav.svg",
              'Payments',
              3,
            ),
            _buildNavItem(context, "assets/icons/menu_nav.svg", 'Menu', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String icon,
    String label,
    int idx,
  ) {
    final bool isSelected = selected == idx;
    return Expanded(
      child: GestureDetector(
        onTap: () => onSelect(idx),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isSelected ? primaryColor : kPurpleGray,
                BlendMode.srcIn,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                color: isSelected ? primaryColor : kPurpleGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
