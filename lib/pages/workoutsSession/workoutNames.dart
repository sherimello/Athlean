import 'package:flutter/material.dart';

class WorkoutItems {
  final String name, image;
  final DateTime date;
  late final String details;

  WorkoutItems({

    required this.name,
    required this.image,
    required this.date,
  });
}



List<WorkoutItems> workoutLists = [
  WorkoutItems(

    name: "Pull up",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
  ),
  WorkoutItems(

    name: "PushUp",
    image: "assets/images/Magical_World.png",
    date: DateTime(2020, 3, 10),
  ),
  WorkoutItems(

    name: "Red Mountains",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
  ),
];