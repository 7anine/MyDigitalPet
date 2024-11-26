import 'package:flutter_riverpod/flutter_riverpod.dart';

class Pet {
  Pet({
    required this.name,
    required this.age,
    required this.breed,
    required this.quote,
    required this.hunger,
    required this.mood,
    required this.owner,
    required this.tasks
  }) : description = '$age year old $breed', image = 'assets/images/$name.jpg', ownerimage = 'assets/images/$owner.jpg';

  final String name;
  final int age;
  final String breed;
  final String image;
  final String quote;
  final double hunger;
  final double mood;
  final String description;
  final String owner;   //Boy or Girl
  final String ownerimage;
  final List<Map<String, String>> tasks; // Update the type of tasks
}

class PetListNotifier extends StateNotifier<List<Pet>> {
  PetListNotifier() : super([]);

  void addPet(Pet pet) {
    state = [...state, pet];
  }

  void updatePet(int index, Pet updatedPet) {
    state = [
      ...state.take(index),
      updatedPet,
      ...state.skip(index + 1),
    ];
  }
}

final petListProvider = StateNotifierProvider<PetListNotifier, List<Pet>>(
      (ref) => PetListNotifier(),
);
