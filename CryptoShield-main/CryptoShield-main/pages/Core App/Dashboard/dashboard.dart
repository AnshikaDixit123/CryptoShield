
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Core%20App/Generator/generator_encryption.dart';
import 'package:cryptog/pages/Core%20App/HomePage/homepage.dart';
import 'package:cryptog/pages/Core%20App/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectIndex = 0;

  void goToPage(int index) {
    if (index >= 0 && index < _pages.length) {
      setState(() {
        selectIndex = index;
      });
    }
  }

  final List<Widget> _pages = [
    const HomePage(),
    const Generator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tAppName,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person, color: tPrimaryColor,size: 31,),
            onPressed: () => Get.to( () => const ProfileScreen()),
          ),
        ],
      ),
      body: _pages[selectIndex],
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 121, 147, 137),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
          child: GNav(
            selectedIndex: selectIndex,
            onTabChange: (index) => goToPage(index),
            backgroundColor: const Color.fromARGB(255, 121, 147, 137),
            color: const Color(0xFFADC2B5),
            activeColor: const Color(0xFFFFFFFF),
            tabBackgroundColor: const Color(0xFFADC2B5),
            gap: 10,
            padding: const EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'HOME',
              ),
              GButton(
                icon: Icons.lock,
                text: 'Generator',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
