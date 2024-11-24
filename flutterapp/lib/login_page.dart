import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF257180),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF2E5BF)),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous page
          },
        ),
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Background Color
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(color: Color(0xFF257180)),
              ),
            ),
            // Logo Placeholder
            const Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  child: Text(
                    'LOGO',
                    style: TextStyle(
                      color: Color(0xFF257180),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            // E-MAIL Label
            const Positioned(
              top: 250,
              left: 40,
              child: Text(
                'E-MAIL',
                style: TextStyle(
                  color: Color(0xFFF2E5BF),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Email Input
            Positioned(
              top: 280,
              left: 40,
              right: 40,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ),
            // PASSWORD Label
            const Positioned(
              top: 350,
              left: 40,
              child: Text(
                'PASSWORD',
                style: TextStyle(
                  color: Color(0xFFF2E5BF),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Password Input
            Positioned(
              top: 380,
              left: 40,
              right: 40,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ),
            // Sign In Button
            Positioned(
              top: 450,
              left: 40,
              right: 40,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2E5BF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sign In clicked')),
                    );
                  },
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            // Forgot Password
            Positioned(
              top: 520,
              left: 0,
              right: 0,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Forgot Password clicked')),
                    );
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            // Sign In with Google Button
            Positioned(
              top: 580,
              left: 40,
              right: 40,
              child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEEEEEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: Image.network(
                    'https://via.placeholder.com/29x17',
                    height: 20,
                  ),
                  label: const Text(
                    'Sign In with Google',
                    style: TextStyle(
                      color: Color(0xFF182241),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Google Sign In clicked')),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
