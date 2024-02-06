import 'package:flutter/material.dart';
import 'package:the_movie_db/src/presentation/pages/home/screens/home_screen.dart';

class MainTabs extends StatefulWidget {
  const MainTabs({super.key});

  @override
  State<MainTabs> createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
  final List<Widget> _pages = [
    HomeScreen(),
    Text('data'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: TabBarView(
        children: _pages,
      ),
    );
  }
}
