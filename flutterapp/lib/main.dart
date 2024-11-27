import 'package:flutter/material.dart';
import 'package:flutterapp/home_page_child.dart';
import 'package:flutterapp/pet_profile_page.dart';
import 'package:flutterapp/pet_profile_page_child.dart';
import 'package:flutterapp/settings_page.dart';
import 'package:flutterapp/settings_page_child.dart';
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
        '/home_child': (context) => const HomePageChild(),
        '/petprofile': (context) => const PetProfile(),
        '/petprofile_child': (context) => const PetProfileChild(),
        '/settings': (context) => const SettingsPage(petImage: '',),
        '/settings_child': (context) => const SettingsPageChild(petImage: '',),
      },
      home: const HomePage(),
    );
  }
}