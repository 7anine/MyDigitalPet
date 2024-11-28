import 'package:flutter/material.dart';
//import 'package:flutterapp/app_colors.dart';
//import 'package:flutterapp/settings_page_child.dart';
import 'package:flutterapp/textstyle.dart';
import 'package:flutterapp/PetClass.dart';

class SettingsPetInfo extends StatelessWidget{
  const SettingsPetInfo ({super.key});

 @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context)?.settings.arguments as Pet; //retrieves the pet data that was passed from the home page
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: const Color(0xFF257180),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            // Home Icon Button (Right)
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
          ],
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            PetProfileBody(pet: pet,),
          ],
        ),
      ),
    );
  } 
}

class PetInfo extends StatelessWidget {
  final String petName;
  final String petDescription;
  final String petImage;
  const PetInfo({super.key, required this.petName, required this.petDescription,required this.petImage });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 73-60), // Adjust the padding as needed
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5,),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(90.0),
          child: Image.asset(
            petImage,
            width: 200,
            height: 200,
            fit: BoxFit.cover, // Adjust the fit as needed
          )
        ),
      ],
    );
  }
}

class PetProfileBody extends StatefulWidget {
  final Pet pet;
  const PetProfileBody({super.key, required this.pet});
  @override
  _PetProfileBodyState createState() => _PetProfileBodyState();
}

class _PetProfileBodyState extends State<PetProfileBody> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 52),
          ),
          PetInfo(
          petName: widget.pet.name,
          petDescription: widget.pet.description,
          petImage: widget.pet.image,
          ),
          const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 54),
          ),
        ],
        ),
        const Padding(
        padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
        child: Text('Edit Image', style: TextStyles.PetProfileFont2),
        ),
        const Padding(
        padding: EdgeInsets.only(top: 13, left: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Name', style: TextStyles.PetProfileFont5),
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(top: 7, left: 30, right: 30),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
          color: Color(0xFFF2E5BF),
          borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          ),
        ),
        ),
        const Padding(
        padding: EdgeInsets.only(top: 20, left: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Species', style: TextStyles.PetProfileFont5),
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(top: 7, left: 30, right: 30),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
          color: const Color(0xFFF2E5BF),
          borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          ),
        ),
        ),
        const Padding(
        padding: EdgeInsets.only(top: 20, left: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Age', style: TextStyles.PetProfileFont5),
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(top: 7, left: 30, right: 30),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
          color: Color(0xFFF2E5BF),
          borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          ),
        ),
        ),
        const Padding(
        padding: EdgeInsets.only(top: 20, left: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Sexe', style: TextStyles.PetProfileFont5),
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(top: 7, left: 30, right: 30),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
          color: Color(0xFFF2E5BF),
          borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          ),
        ),
        ),
        const Padding(
        padding: EdgeInsets.only(top: 20, left: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Personal Notes', style: TextStyles.PetProfileFont5),
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(top: 7, left: 30, right: 30, bottom : 30),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
          color: Color(0xFFF2E5BF),
          borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          ),
        ),
        ),
      ],
      ),
    );
  }
}