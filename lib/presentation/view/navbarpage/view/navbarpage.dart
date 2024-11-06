import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/presentation/providers/functionsprovider.dart';
import 'package:codeedex_test/presentation/view/home/view/homepage.dart';
import 'package:codeedex_test/presentation/view/profile/view/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
    const ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<FunctionsProvider>(context, listen: false);
    provider.getProducts();
    provider.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: AppColors.green1.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            rippleColor: AppColors.green0,
            hoverColor: AppColors.green1,
            haptic: true,
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: AppColors.green0, width: 1),
            tabBorder: Border.all(color: AppColors.green1, width: 1),
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 300),
            gap: 8,
            color: AppColors.black,
            activeColor: AppColors.white,
            iconSize: 24,
            tabBackgroundColor: AppColors.green0,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
