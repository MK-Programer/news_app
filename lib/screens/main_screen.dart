import 'package:flutter/material.dart';
import 'package:news_app/resources/color_manager.dart';
import 'package:news_app/resources/icon_manager.dart';
import 'package:news_app/resources/string_manager.dart';
import 'package:news_app/resources/values_manager.dart';

import 'bookmark/bookmark_screen.dart';
import 'news/news_screen.dart';
import 'search/search_screen.dart';
import 'settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': AppString.news,
      'page': NewsScreen(),
    },
    {
      'title': AppString.search,
      'page': SearchScreen(),
    },
    {
      'title': AppString.bookmark,
      'page': BookMarkScreen(),
    },
    {
      'title': AppString.settings,
      'page': SettingsScreen(),
    },
  ];

  void _selectedPage(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // identify the height of the appbar
        toolbarHeight: AppSize.s80,
        // remove the leading back icon
        automaticallyImplyLeading: false,
        title: Text(_pages[_selectedIndex]['title']),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ColorManager.grey,
        selectedItemColor: ColorManager.orange,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.cardColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              IconManager.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconManager.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconManager.bookmark,
            ),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconManager.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
