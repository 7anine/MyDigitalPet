import 'package:flutter/material.dart';
import 'package:flutterapp/pet_profile_page.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/petprofile': (context) => const PetProfile(),
      },
      home: const PetProfile(),
    );
  }
}