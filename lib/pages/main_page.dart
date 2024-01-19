import 'package:flutter/material.dart';
import 'package:my_blog/components/bar_item_page.dart';
import 'package:my_blog/components/my_page.dart';
import 'package:my_blog/components/search_page.dart';

import '../components/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage()
  ];

  int currentIndex = 0;

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.withOpacity(.8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps, size: 25,)),
          BottomNavigationBarItem(label: "Bar", icon: Icon(Icons.bar_chart_sharp, size: 25)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search, size: 25)),
          BottomNavigationBarItem(label: "My", icon: Icon(Icons.person, size: 25))
        ]
      ),
    );
  }
}
