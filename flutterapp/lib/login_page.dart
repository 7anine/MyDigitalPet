import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _selectedAccountType = 'Parent'; // Default account type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow
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
            // Logo
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 150, // Set the width for the square
                  height: 150, // Set the height for the square
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    image: DecorationImage(
                      image: AssetImage('assets/images/smalllogo.png'), // Image source
                      fit: BoxFit.cover, // Ensures the image covers the whole area
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
            // Account Type Label
            const Positioned(
              top: 450,
              left: 40,
              child: Text(
                'ACCOUNT TYPE',
                style: TextStyle(
                  color: Color(0xFFF2E5BF),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Account Type Dropdown
            Positioned(
              top: 480,
              left: 40,
              right: 40,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedAccountType,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedAccountType = newValue!;
                      });
                    },
                    items: <String>['Parent', 'Child']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            // Sign In Button
            Positioned(
              top: 550,
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
                    if (_selectedAccountType == 'Parent') {
                      Navigator.pushNamed(context, '/home');
                    } else {
                      Navigator.pushNamed(context, '/home_child');
                    }
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
              top: 620,
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
          ],
        ),
      ),
    );
  }
}