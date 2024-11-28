import 'package:flutter/material.dart';
import 'package:flutterapp/resource_page.dart';
import 'package:flutterapp/settings_pet_info.dart';
import 'package:flutterapp/vet_records.dart';
import 'app_colors.dart';
import 'PetClass.dart';

class SettingsPageChild extends StatelessWidget {
  final Pet pet;

  const SettingsPageChild({super.key, required this.pet});

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
                  backgroundImage: AssetImage(pet.image),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildCard(context, 'Edit Pet Info', onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => SettingsPetInfo(),
                settings: RouteSettings(arguments: pet),
              ),
            );
          }),
          _buildCard(context, 'Task History'),
          _buildCard(context, 'Resource Center', onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => ResourcePage(),
                settings: RouteSettings(arguments: pet),
              ),
            );
          }),
          //_buildCard(context, 'Vet Records'),
          _buildCard(context, 'Vet Records', onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VetRecords(),
                settings: RouteSettings(arguments: pet),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, {Widget? leading, VoidCallback? onTap}) {
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
        onTap: onTap,
      ),
    );
  }
}