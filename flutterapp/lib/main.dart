import 'package:flutter/material.dart';
import 'package:flutterapp/home_page_child.dart';
import 'package:flutterapp/pet_profile_page.dart';
import 'package:flutterapp/pet_profile_page_child.dart';
import 'package:flutterapp/settings_page.dart';
import 'package:flutterapp/settings_page_child.dart';
import 'package:flutterapp/alerts_page.dart';
import 'PetData.dart';
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
        '/settings': (context) => SettingsPage(pet: pets[0],),  //pet[0] is just default
        '/settings_child': (context) =>  SettingsPageChild(pet: pets[0],),
        '/alerts': (context) => AlertsPage(),
      },
      home: const HomePage(),
    );
  }
}