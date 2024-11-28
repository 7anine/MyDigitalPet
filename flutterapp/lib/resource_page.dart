import 'package:flutter/material.dart';
//import 'package:flutterapp/app_colors.dart';
//import 'package:flutterapp/settings_page_child.dart';
//import 'package:flutterapp/textstyle.dart';
import 'package:flutterapp/PetClass.dart';

class ResourcePage extends StatelessWidget{
  const ResourcePage ({super.key});

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
      body: PetProfileBody(pet: pet,),
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
    return Column(
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
      ],
    );
  }
}