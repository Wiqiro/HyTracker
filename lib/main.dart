import 'package:flutter/material.dart';
import 'package:hytracker/providers/user.dart';
import 'package:hytracker/screens/login_screen.dart';
import 'package:hytracker/screens/stats_gamemodes_screens/bedwars_stats_screen.dart';
import 'package:hytracker/screens/stats_gamemodes_screens/skywars_stats_screen.dart';
import 'package:hytracker/screens/stats_menu_screen.dart';
import 'package:provider/provider.dart';

import 'models/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: Consumer<UserProvider>(
        builder: (ctx, user, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HyTracker',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color.fromRGBO(255, 100, 100, 1),
              onPrimary: Colors.black,
              secondary: Color.fromRGBO(255, 150, 150, 1),
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.black,
              surface: Color.fromRGBO(235, 235, 235, 1),
              onSurface: Colors.black,
              primaryContainer: Color.fromRGBO(235, 235, 235, 1),
              secondaryContainer: Color.fromRGBO(215, 215, 215, 1),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              centerTitle: true,
              titleTextStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 26, color: Colors.black),
              toolbarHeight: 60,
            ),
          ),
          home: const LoginScreen(),
          routes: {
            LoginScreen.routeName: (context) => const LoginScreen(),
            StatsMenuScreen.routeName: (context) => const StatsMenuScreen(),
            //BedwarsStatsScreen.routeName: (context) => const BedwarsStatsScreen(),
            SkywarsStatsScreen.routeName: (context) => const SkywarsStatsScreen()
          },
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case BedwarsStatsScreen.routeName:
                return MaterialPageRoute(
                  builder: (context) {
                    return BedwarsStatsScreen(player: settings.arguments as Player);
                  },
                );
              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}
