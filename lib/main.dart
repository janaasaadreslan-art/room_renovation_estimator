import 'package:flutter/material.dart';
import 'screens/home_page.dart';
void main() {
  runApp(const RenovateApp());
}

class RenovateApp extends StatelessWidget {
  const RenovateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renovate',
      debugShowCheckedModeBanner: false,//remove red DEBUG banner
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB85042)),//box color
      ),
      home: const HomePage(),
    );
  }
}

