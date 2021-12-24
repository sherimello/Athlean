import 'package:flutter/material.dart';
//import 'User.dart';

class ExerciseList {
  final String name, image;
  final String calBurn;
  final String Details;
  late String workoutburn;
  //final List<User> users;

  ExerciseList({
    //required this.users,
    required this.name,
    required this.workoutburn,
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
      calBurn: "3.3",
      workoutburn: "",
      Details:
          "The PullUps is a classic strength-building move that everyone needs to do in the gym. But whatever you do, don’t lose your form in favor of reps. Keep those legs straight for maximum payoff."),
  ExerciseList(
      //users: users..shuffle(),
      name: "PushUps",
      image: "assets/images/pushup.jpeg",
      calBurn: "2.2",
      workoutburn: "",
      Details: " "),
  ExerciseList(
      //users: users..shuffle(),
      name: "Leg Curl",
      image: "assets/images/legcurl.jpeg",
      calBurn: "3.5",
      workoutburn: "",
      Details: " "),
  ExerciseList(
    //users: users..shuffle(),
    name: "Dumbbell\nCurl",
    image: "assets/images/dumbbellcurl.jpeg",
    calBurn: "2.1",
    workoutburn: "",
    Details: " ",
  ),
  ExerciseList(
    //users: users..shuffle(),
    name: "Leg Ext.",
    image: "assets/images/legext.jpeg",
    calBurn: "3.6",
    workoutburn: "",
    Details: " ",
  ),
  ExerciseList(
      //users: users..shuffle(),
      name: "Squat",
      image: "assets/images/squat.jpeg",
      calBurn: "4.1",
      workoutburn: "",
      Details: " "),
  ExerciseList(
    //users: users..shuffle(),
    name: "Calf Raise",
    image: "assets/images/calfraise.jpeg",
    calBurn: "3.5",
    workoutburn: "",
    Details: " ",
  ),
];

class UserDatas {
  final String name;
  final double cal_Burn;
  final double workoutDur;
  //final List<User> users;

  UserDatas({
    required this.name,
    required this.workoutDur,
    required this.cal_Burn,
  });
}

List<UserDatas> users = [];
