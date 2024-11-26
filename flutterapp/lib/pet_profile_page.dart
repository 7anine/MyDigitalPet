import 'package:flutter/material.dart';
import 'package:flutterapp/app_colors.dart';
import 'package:flutterapp/textstyle.dart';
import 'package:flutterapp/PetClass.dart';
import 'dart:math';

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


class PetProfileBody extends StatefulWidget {
  final Pet pet;
  const PetProfileBody({super.key, required this.pet});
  @override
  _PetProfileBodyState createState() => _PetProfileBodyState();
}

class _PetProfileBodyState extends State<PetProfileBody> {
  double hungerLevel = 0.0; // Initialize with pet's hunger
  double moodLevel = 0.0;   // Initialize with pet's mood

  @override
  void initState() {
    super.initState();
    hungerLevel = widget.pet.hunger;
    moodLevel = widget.pet.mood;
  }

  void updateHungerMood(String taskType, double value) {
    setState(() {
      if (taskType == 'hunger') {
        hungerLevel = min(hungerLevel + value, 1.0);
      } else if (taskType == 'mood') {
        moodLevel = min(moodLevel + value, 1.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 52), // Adjust the padding as needed
              child: MoodMeter(moodLevel: moodLevel),
            ),
            PetInfo(petName: widget.pet.name, petDescription: widget.pet.description, petImage: widget.pet.image, ownerImage: widget.pet.ownerimage,),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 54), // Adjust the padding as needed
              child: HungerMeter(hungerLevel: hungerLevel),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0), // Adjust padding as needed
          child: Text(widget.pet.quote, style: TextStyles.PetProfileFont3), // Customize text style
        ),
        ListView.builder(
          itemCount: widget.pet.tasks.length,
          itemBuilder: (context, index) {
            final task = widget.pet.tasks[index];
            return Column(
              children: [
                TaskCard(taskText: task['text']!, taskType: task['type']!, taskValue: double.parse(task['value']!)),
                if (index != widget.pet.tasks.length - 1) Divider(color: Colors.white),
              ],
            );
          },
          shrinkWrap: true,
        ),
      ],
    );
  }
}

class TaskCard extends StatefulWidget {
  final String taskText;
  final String taskType;
  final double taskValue;
  bool isCompleted;
  TaskCard({super.key, required this.taskText, required this.taskType, required this.taskValue, this.isCompleted = false});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isClicked ? null : () {
        setState(() {
          final petProfileBodyState = context.findAncestorStateOfType<_PetProfileBodyState>();
          if (petProfileBodyState != null) {
            petProfileBodyState.updateHungerMood(widget.taskType, widget.taskValue);
            widget.isCompleted = true;
            _isClicked = true;
          }
        });
      },
      child: Container(
        width: 378,
        height: 49,
        decoration: BoxDecoration(
          color: _isClicked ? AppColors.PetGrey : AppColors.PetBeige,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Center(
                  child: Text(widget.taskText, style: TextStyles.PetProfileFont4),
                ),
              ),
              if (_isClicked)
                Image.asset(
                  'assets/images/checkmark.png',
                  width: 20,
                  height: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pet info widget -------------------------------------------------------------
class PetInfo extends StatelessWidget {
  final String petName;
  final String petDescription;
  final String petImage;
  final String ownerImage;

  const PetInfo({
    super.key,
    required this.petName,
    required this.petDescription,
    required this.petImage,
    required this.ownerImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 13), // Adjust the padding as needed
          child: Text(petName, style: TextStyles.PetProfileFont1),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(petDescription, style: TextStyles.PetProfileFont2),
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(90.0),
              child: Image.asset(
                petImage,
                width: 200,
                height: 200,
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  ownerImage,
                  width: 60, // Increased size
                  height: 60, // Increased size
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
            ),
          ],
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

