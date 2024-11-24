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
      body: const Group31(),
    );
  }
}

class Group31 extends StatelessWidget {
  const Group31({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenWidth * 0.02,
      ),
      child: GridView.count(
        crossAxisCount: 3, // 3 cards per row
        crossAxisSpacing: screenWidth * 0.02, // 2% spacing between columns
        mainAxisSpacing: screenWidth * 0.02, // 2% spacing between rows
        children: const [
          // SingleCard Widgets
          SingleCard(
            name: 'Jasper',
            imageUrl: 'https://via.placeholder.com/100x100',
            cornerImage: 'https://via.placeholder.com/21x25',
          ),
          SingleCard(
            name: 'Buster',
            imageUrl: 'https://via.placeholder.com/100x100',
            cornerImage: 'https://via.placeholder.com/22x25',
          ),
          SingleCard(
            name: 'Peanut',
            imageUrl: 'https://via.placeholder.com/100x100',
            cornerImage: 'https://via.placeholder.com/20x20',
          ),
          SingleCard(
            name: 'Stewart',
            imageUrl: 'https://via.placeholder.com/100x100',
            cornerImage: 'https://via.placeholder.com/22x22',
          ),
          SingleCard(
            name: 'Tito',
            imageUrl: 'https://via.placeholder.com/100x100',
            cornerImage: 'https://via.placeholder.com/22x22',
          ),
          AddCard()
        ],
      ),
    );
  }
}

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.92 / 3; // 3 cards fit the screen width
    final cardHeight = cardWidth * 1.2; // Maintain aspect ratio

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: ShapeDecoration(
        color: const Color(0xFFF2E5BF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.add,
          color: const Color(0xFF257180),
          size: cardWidth * 0.4, // Adjust size of the plus sign
        ),
      ),
    );
  }
}


class SingleCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String cornerImage;

  const SingleCard({
    required this.name,
    required this.imageUrl,
    required this.cornerImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Retrieve screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.92 / 3; // 3 cards fit the screen width
    final cardHeight = cardWidth * 1.2; // Maintain aspect ratio

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: ShapeDecoration(
        color: const Color(0xFFF2E5BF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Centered Text
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF257180),
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: cardWidth * 0.05,
                vertical: cardWidth * 0.1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Column
                  SizedBox(
                    width: cardWidth * 0.15,
                    height: cardHeight * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Top Image
                        Container(
                          width: cardWidth * 0.15,
                          height: cardWidth * 0.15,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(cornerImage),
                              fit: BoxFit.cover,
                            ),
                            shape: const OvalBorder(),
                          ),
                        ),
                        // Bottom Image
                        Container(
                          width: cardWidth * 0.15,
                          height: cardWidth * 0.15,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(cornerImage),
                              fit: BoxFit.cover,
                            ),
                            shape: const OvalBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Center Image
                  Container(
                    width: cardWidth * 0.6,
                    height: cardWidth * 0.6,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                      shape: const OvalBorder(),
                    ),
                  ),
                  // Right Column
                  SizedBox(
                    width: cardWidth * 0.15,
                    height: cardHeight * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Top Image
                        Container(
                          width: cardWidth * 0.15,
                          height: cardWidth * 0.15,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(cornerImage),
                              fit: BoxFit.cover,
                            ),
                            shape: const OvalBorder(),
                          ),
                        ),
                        // Bottom Image
                        Container(
                          width: cardWidth * 0.15,
                          height: cardWidth * 0.15,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(cornerImage),
                              fit: BoxFit.cover,
                            ),
                            shape: const OvalBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
          // Centered Image
        ],
      ),
    );
  }
}
