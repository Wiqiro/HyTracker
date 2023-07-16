import 'package:flutter/material.dart';
import 'package:hytracker/providers/user.dart';
import 'package:hytracker/screens/login_screen.dart';
import 'package:provider/provider.dart';

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
        ),
      ),
    );
  }
}
