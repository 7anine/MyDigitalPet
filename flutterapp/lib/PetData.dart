import 'package:flutterapp/PetClass.dart';

List<Pet> pets = [
  Pet(
    name: 'Jasper',
    age: 5,
    breed: 'Border Collie',
    quote: 'Specializes in belly rubs, and stealing socks.',
    hunger: 0.5,
    mood: 0.5,
    owner: 'Boy',
    tasks: [
      {'text': 'I’M THIRSTY, PLEASE CHANGE MY WATER.', 'type': 'hunger', 'value': '0.2', 'isCompleted': false},
      {'text': 'I AM GETTING HUNGRY, TIME TO EAT!', 'type': 'hunger', 'value': '0.5', 'isCompleted': false},
      {'text': 'I MISS YOU!  LET’S PLAY SOMETHING. <3', 'type': 'mood', 'value': '0.3', 'isCompleted': false},
      {'text': 'I WOULD LOVE TO GO FOR A WALK.', 'type': 'mood', 'value': '0.2', 'isCompleted': false},
      {'text': 'TIME FOR MY CHECKUP AT THE VET... :(', 'type': 'mood', 'value': '0.1', 'isCompleted': false}
    ],
  ),
  Pet(
    name: 'Buster',
    age: 4,
    breed: 'French Bulldog',
    quote: 'Loves treats.',
    hunger: 0.5,
    mood: 0.5,
    owner: 'Girl',
    tasks: [
      {'text': 'PLEASE CHANGE MY WATER HUMAN.', 'type': 'hunger', 'value': '0.1', 'isCompleted': false},
      {'text': 'IM SOOO HUNGRY!', 'type': 'hunger', 'value': '0.4', 'isCompleted': false},
      {'text': 'LET’S PLAY SOMETHING!', 'type': 'mood', 'value': '0.3', 'isCompleted': false},
      {'text': 'I DEMAND TO GO FOR A WALK.', 'type': 'mood', 'value': '0.2', 'isCompleted': false}
    ],
  ),
  Pet(
    name: 'Peanut',
    age: 1,
    breed: 'Hamster',
    quote: 'Peanuts are my favourite!',
    hunger: 0,
    mood: 0,
    owner: 'Boy',
    tasks: [
      {'text': 'CHANGE WATER', 'type': 'hunger', 'value': '0.5', 'isCompleted': false},
      {'text': 'FEED SOME SEEDS', 'type': 'hunger', 'value': '0.5', 'isCompleted': false},
      {'text': 'CLEAN CAGE', 'type': 'mood', 'value': '1', 'isCompleted': false}
    ],
  ),
  Pet(
    name: 'Stewart',
    age: 2,
    breed: 'Hamster',
    quote: 'Stew the menace',
    hunger: 0,
    mood: 0,
    owner: 'Boy',
    tasks: [
      {'text': 'CHANGE WATER', 'type': 'hunger', 'value': '0.5', 'isCompleted': false},
      {'text': 'FEED SOME SEEDS', 'type': 'hunger', 'value': '0.5', 'isCompleted': false},
      {'text': 'CLEAN CAGE', 'type': 'mood', 'value': '1', 'isCompleted': false}
    ],
  ),
  Pet(
    name: 'Tito',
    age: 3,
    breed: 'Hamster',
    quote: 'Hi, I am Tito',
    hunger: 0,
    mood: 0,
    owner: 'Boy',
    tasks: [
      {'text': 'CHANGE WATER', 'type': 'hunger', 'value': '0.5', 'isCompleted': false},
      {'text': 'FEED SOME SEEDS', 'type': 'hunger', 'value': '0.5', 'isCompleted': false},
      {'text': 'CLEAN CAGE', 'type': 'mood', 'value': '1', 'isCompleted': false}
    ],
  ),
];