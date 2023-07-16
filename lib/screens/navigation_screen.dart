import 'package:flutter/material.dart';
import 'package:hytracker/screens/recent_screen.dart';
import 'package:hytracker/screens/stats_menu_screen.dart';
import 'package:hytracker/screens/tracker_screen.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final _keys = [GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>()];

  void _selectPage(int index, BuildContext context) {
    if (_selectedIndex == index) {
      _keys[_selectedIndex].currentState?.popUntil((route) => route.isFirst);
    } else if (mounted) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          _keys[_selectedIndex].currentState?.maybePop();
          return false;
        },
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            Navigator(
              key: _keys[0],
              onGenerateRoute: (route) => MaterialPageRoute(
                builder: (context) => StatsMenuScreen(Provider.of<UserProvider>(context).player),
                settings: route,
              ),
            ),
            Navigator(
              key: _keys[1],
              onGenerateRoute: (route) => MaterialPageRoute(
                builder: (context) => const TrackerScreen(),
                settings: route,
              ),
            ),
            Navigator(
              key: _keys[2],
              onGenerateRoute: (route) => MaterialPageRoute(
                builder: (context) => const RecentScreen(),
                settings: route,
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
              offset: Offset(0, 2),
            )
          ],
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const ImageIcon(
                AssetImage('assets/images/profile.png'),
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _selectPage(0, context);
                });
              },
              color: _selectedIndex == 0 ? Theme.of(context).primaryColor : Colors.black,
            ),
            IconButton(
              icon: const ImageIcon(
                AssetImage('assets/images/tracker.png'),
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _selectPage(1, context);
                });
              },
              color: _selectedIndex == 1 ? Theme.of(context).primaryColor : Colors.black,
            ),
            IconButton(
              icon: const ImageIcon(
                AssetImage('assets/images/history.png'),
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _selectPage(2, context);
                });
              },
              color: _selectedIndex == 2 ? Theme.of(context).primaryColor : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
