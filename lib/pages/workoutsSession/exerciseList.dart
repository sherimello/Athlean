import 'package:flutter/material.dart';
//import 'User.dart';

class ExerciseList {
  final String name, image;
  final String calBurn;
  final String Details;
  //final List<User> users;

  ExerciseList({
    //required this.users,
    required this.name,
    required this.image,
    required this.calBurn,
    required this.Details,
  });
}

List<ExerciseList> exercises = [
  ExerciseList(
      //users: users..shuffle(),
      name: "PullUps",
      image: "assets/images/pullups.png",
      calBurn: "Amounts",
      Details:
          "The PullUps is a classic strength-building move that everyone needs to do in the gym. But whatever you do, don’t lose your form in favor of reps. Keep those legs straight for maximum payoff."),
  ExerciseList(
      //users: users..shuffle(),
      name: "PushUps",
      image: "assets/images/pushup.jpeg",
      calBurn: "Amounts",
      Details: " "),
  ExerciseList(
      //users: users..shuffle(),
      name: "Leg Curl",
      image: "assets/images/legcurl.jpeg",
      calBurn: "Amounts",
      Details: " "),
  ExerciseList(
      //users: users..shuffle(),
      name: "Dumbbell\nCurl",
      image: "assets/images/dumbbellcurl.jpeg",
      calBurn: "Amounts",
      Details: " "),
  ExerciseList(
      //users: users..shuffle(),
      name: "Leg Ext.",
      image: "assets/images/legext.jpeg",
      calBurn: "Amounts",
      Details: " "),
  ExerciseList(
      //users: users..shuffle(),
      name: "Squat",
      image: "assets/images/squat.jpeg",
      calBurn: "Amounts",
      Details: " "),
  ExerciseList(
      //users: users..shuffle(),
      name: "Calf Raise",
      image: "assets/images/calfraise.jpeg",
      calBurn: "Amounts",
      Details: " "),
];

//List<User> users = [user1, user2, user3];
