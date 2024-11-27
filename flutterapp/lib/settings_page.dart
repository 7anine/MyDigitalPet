import 'package:flutter/material.dart';
import 'app_colors.dart';

class SettingsPage extends StatelessWidget {
  final String petImage;
  final String ownerImage;

  const SettingsPage({super.key, required this.petImage, required this.ownerImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.PetBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: AppColors.PetBeige, // Change the color of the back arrow
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(petImage),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildCard(context, 'Assign Responsible', leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(ownerImage),
          )),
          _buildCard(context, 'Task History'),
          _buildCard(context, 'Manage Tasks'),
          _buildCard(context, 'Edit Pet Info'),
          _buildCard(context, 'Resource Center'),
          _buildCard(context, 'Vet Records'),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, {Widget? leading}) {
    return Card(
      color: AppColors.PetRed,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        leading: leading,
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black, // Change the text color to black
              fontFamily: 'OpenSansExtraBold',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
          // Handle navigation
        },
      ),
    );
  }
}