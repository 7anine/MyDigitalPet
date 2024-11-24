import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF257180),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home Icon Button (Left)
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Color(0xFFF2E5BF),
                size: 30,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Already on Home Page!')),
                );
              },
            ),
            // Title
            const Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            // User Icon Button (Right)
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Color(0xFFF2E5BF),
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}
