import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:medihelp/ui/articles.dart';
import 'package:medihelp/ui/home_page.dart';
import 'package:medihelp/ui/near.dart';
import 'package:medihelp/ui/theme.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BlogsScreen(),
    MyWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: context.theme.backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Color.fromARGB(255, 255, 255, 255),
              hoverColor: Color.fromARGB(255, 255, 255, 255),
              gap: 8,
              activeColor: context.theme.backgroundColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: primaryClr,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  iconColor: Get.isDarkMode ? Colors.white : Colors.black,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.blog,
                  iconColor: Get.isDarkMode ? Colors.white : Colors.black,
                  text: 'Blogs',
                ),
                GButton(
                  icon: LineIcons.search,
                  iconColor: Get.isDarkMode ? Colors.white : Colors.black,
                  text: 'Search',
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
      ),
    );
  }
}
