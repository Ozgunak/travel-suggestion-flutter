import 'package:flutter/material.dart';
import 'package:travel/Screens/catalog-screen.dart';
import 'package:travel/Screens/welcome.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.light(background: Color(0xFFA6CDC3)),
            useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        routes: {
          '/catalog': (context) => CatalogScreen(),
          '/welcome': (context) => WelcomeScreen(),
        });
  }
}
