import 'package:flutter/material.dart';
import 'package:flutterapp/PetClass.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key});

  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  int _currentIndex = 0; // Track the current section

  final List<Map<String, dynamic>> _resources = [
    {
      'title': 'How to groom your pet',
      'content': [
        'Grooming is essential for maintaining your pet’s health and comfort. A well-groomed pet is not only happier but also less likely to develop skin issues, matting, or discomfort caused by overgrown nails or dirty fur.',
        'Brushing your pet regularly helps remove loose fur, prevents tangles, and distributes natural oils, giving their coat a healthy shine. This is especially important for long-haired breeds like Golden Retrievers or Persian cats, where matting can occur quickly. ',
        'Overgrown nails can cause discomfort, difficulty walking, and even joint pain in pets. Dogs and cats with long nails might snag them on carpets or furniture, leading to painful injuries. Trim your pet’s nails every 3–4 weeks, or as needed, depending on their activity level. ',
        'Bathing your pet depends on its species and breed. Dogs generally need a bath every 4–6 weeks, while cats often groom themselves and may rarely require bathing unless they get into something messy. Use a pet-safe shampoo specific to their needs to avoid irritating their skin.',
        'Nail care is vital but often overlooked. Trim your pet’s nails every few weeks or as needed to prevent overgrowth, which can cause discomfort or even lead to infections. Be cautious not to cut into the quick of the nail as it can bleed and cause pain.',
        'Regularly check your pet’s skin and fur for signs of irritation, fleas, ticks, or unusual lumps. Early detection can prevent minor issues from becoming major health concerns. Address any issues promptly with your vet to ensure your pet stays healthy and comfortable.',
      ],
    },
    {
      'title': 'How to feed your pet',
      'content': [
        'Feeding your pet a balanced diet is one of the most important aspects of pet care. Start by choosing a high-quality pet food that meets the nutritional requirements for your pet’s species, age, breed, and activity level. Many pet foods are specifically formulated for puppies, kittens, adult pets, or seniors, so choose accordingly.',
        'Portion control is key. Overfeeding your pet can lead to obesity, which increases the risk of health issues such as diabetes, heart disease, and joint problems. Follow the feeding guidelines on the pet food packaging and adjust as needed based on your pet’s weight and activity level.',
        'Always provide fresh, clean water for your pet. Hydration is critical to maintaining their overall health, especially during hot weather or after exercise.',
        'Avoid giving your pet foods that are toxic to them, such as chocolate, onions, garlic, grapes, or raisins. Treats should only make up a small portion of their diet and should not replace balanced meals. Consult your veterinarian if you have any questions about your pet’s specific dietary needs.',
      ],
    },
    {
      'title': 'How to socialize your pet',
      'content': [
        'Socialization is critical for a pet’s mental well-being and helps them adjust to new environments, people, and other animals. Start socializing your pet at a young age, but even older pets can benefit from gradual exposure to new experiences.',
        'Introduce your pet to new people, pets, and situations in a controlled manner. For example, start with quiet environments before progressing to busier ones like parks. Keep initial interactions short and positive to prevent overwhelming your pet.',
        'Use positive reinforcement, such as treats and praise, to reward your pet for calm and friendly behavior. Avoid scolding or punishing your pet during socialization, as this can increase anxiety or aggression.',
        'Take your pet for walks or visits to pet-friendly parks to help them interact with other pets. Supervise these interactions to ensure they are safe and enjoyable for everyone involved.',
        'If your pet is shy or anxious, take it slow. You might need to provide additional training or consult a behaviorist to help your pet feel more comfortable.',
      ],
    },
  ];

  void _goToNext() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _resources.length;
    });
  }

  void _goToPrevious() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _resources.length) % _resources.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context)?.settings.arguments as Pet; // Retrieves the pet data.

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF257180),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Color(0xFFF2E5BF),
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home_child');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications, // New button for alerts
                color: Color(0xFFF2E5BF),
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/alerts'); // Navigate to Alerts Page
              },
            ),

          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          // Pet Image
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(pet.image),
          ),
          const SizedBox(height: 20),

          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: _goToPrevious,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'previous',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _goToNext,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'next',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Title
          Text(
            _resources[_currentIndex]['title'],
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF257180),
            ),
          ),
          const SizedBox(height: 20),

          // Content Section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2E5BF),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: _resources[_currentIndex]['content'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      _resources[_currentIndex]['content'][index],
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
