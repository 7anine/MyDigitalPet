import 'package:flutter/material.dart';
import 'package:flutterapp/app_colors.dart';
import 'package:flutterapp/textstyle.dart';
import 'package:flutterapp/PetClass.dart';

class PetProfile extends StatelessWidget{
  const PetProfile ({super.key});
  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context)?.settings.arguments as Pet; //retrieves the pet data that was passed from the home page
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF257180),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Settings Icon Button (Left)
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Color(0xFFF2E5BF),
                size: 30,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('To settings...')),
                );
              },
            ),
            // Home Icon Button (Right)
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Color(0xFFF2E5BF),
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
      body: PetProfileBody(pet: pet,),
    );
  }
}



class PetProfileBody extends StatelessWidget {
  final Pet pet;
  const PetProfileBody({super.key,required this.pet });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 92-40), // Adjust the padding as needed
          child: MoodMeter(moodLevel: pet.mood),
        ),
        PetInfo(petName: pet.name, petDescription: pet.description, petImage: pet.image,),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 94-40), // Adjust the padding as needed
          child: HungerMeter(hungerLevel: pet.hunger),
        ),
      ],
      );
  }
}

// Pet info widget -------------------------------------------------------------
class PetInfo extends StatelessWidget {
  final String petName;
  final String petDescription;
  final String petImage;
  const PetInfo({super.key, required this.petName, required this.petDescription,required this.petImage });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 73-60), // Adjust the padding as needed
          child:
          Text(petName , style: TextStyles.PetProfileFont1,),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5,),
          child:
          Text(petDescription , style: TextStyles.PetProfileFont2,),
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


//HUNGER METER------------------------------------------------------------------
class HungerMeter extends StatelessWidget {
  final double hungerLevel; // Value between 0 (full) and 1 (empty)
  const HungerMeter({super.key, required this.hungerLevel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getImageHunger(hungerLevel),
        SizedBox(height: 10), // Add spacing here
        Stack(   //To stack the two containers (first one is at the bottom)
          children: [
            ClipRRect( //USED TO ADD CORNERS TO THE CONTAINER
              borderRadius: BorderRadius.circular(30.0), // Adjust the radius
              child: Container(
                height: 182,
                width: 54,
                color: AppColors.PetBlue,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(MeterCorners(hungerLevel)), topRight: Radius.circular(MeterCorners(hungerLevel)),bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                child: Container(
                  height: 182 * hungerLevel,
                  width: 54,
                  color: MeterColor(hungerLevel),
                ),
              ),
            ),
          ]
        ),
      ]
    );
  }

  Color MeterColor(double level) {
    if (level >= 0.8) {
      return Colors.green;
    } else if (level > 0.5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  double MeterCorners(double level) {  //When the meter is full, we need to match change the corners to match the meter
    if (level == 1) {
    return 30.0;
    } else {
      return 0;
    }
  }

  Widget getImageHunger(double level) {
    if (level >= 0.8) {
        return Image.asset('assets/images/DogBowlGreen.png', width : 50 , height : 50 , fit: BoxFit.fill,);
    } else if (level > 0.5) {
        return Image.asset('assets/images/DogBowlOrange.png', width : 50 , height : 50 , fit: BoxFit.fill,);
    } else {
        return Image.asset('assets/images/DogBowlRed.png', width : 50 , height : 50 , fit: BoxFit.fill,);
    }
  }

}


//MOOD METER------------------------------------------------------------------
class MoodMeter extends StatelessWidget {
  final double moodLevel; // Value between 0 (full) and 1 (empty)
  const MoodMeter({super.key, required this.moodLevel});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          getImageMood(moodLevel),
          SizedBox(height: 10), // Add spacing here
          Stack( //To stack the two containers (first one is at the bottom)
              children: [
                ClipRRect( //USED TO ADD CORNERS TO THE CONTAINER
                  borderRadius: BorderRadius.circular(30.0),
                  // Adjust the radius
                  child: Container(
                    height: 182,
                    width: 54,
                    color: AppColors.PetBlue,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MeterCorners(moodLevel)),
                        topRight: Radius.circular(MeterCorners(moodLevel)),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    child: Container(
                      height: 182 * moodLevel,
                      width: 54,
                      color: MeterColor(moodLevel),
                    ),
                  ),
                ),
              ]
          ),
        ]
    );
  }


  Color MeterColor(double level) {
    if (level >= 0.8) {
      return Colors.green;
    } else if (level > 0.5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  double MeterCorners(double level) {
    //When the meter is full, we need to match change the corners to match the meter
    if (level == 1) {
      return 30.0;
    } else {
      return 0;
    }
  }

  Widget getImageMood(double level) {
    if (level >= 0.8) {
      return Image.asset('assets/images/SmileyGreen.png', width : 50 , height : 50 , fit: BoxFit.fill,);
    } else if (level > 0.5) {
      return Image.asset('assets/images/SmileyOrange.png', width : 50 , height : 50 , fit: BoxFit.fill,);
    } else {
      return Image.asset('assets/images/SmileyRed.png', width : 50 , height : 50 , fit: BoxFit.fill,);
    }
  }

}

