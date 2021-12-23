import 'package:athlean/pages/workoutsSession/card.dart';
import 'package:athlean/pages/workoutsSession/exerciseList.dart';
import 'package:athlean/widgets/categorycard.dart';
import 'package:athlean/widgets/home_progress_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'workoutNames.dart';

class Pushups extends StatelessWidget {
  //final String exerciseName;
  final String index;

  const Pushups({
    Key? key,
    //required this.exerciseName,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listIndex = int.parse(index);
    String exerciseName = exercises[listIndex].name;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/exercisebg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              snap: true,
              floating: true,
              title: Text(
                "AthLean",
                textAlign: TextAlign.start,
              ),
              elevation: 0.00,
              expandedHeight: MediaQuery.of(context).size.height * .35,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(fit: StackFit.expand, children: [
                  Image.asset(
                    exercises[listIndex].image,
                    fit: BoxFit.cover,
                  ),
                ]),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 7, 19, 7),
                          child: Row(
                            children: [
                              Text(
                                exerciseName,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "(Cal Burn - 2Kcal/min)",
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // new profile_header_user_info_text(
                        //     '01XXXXXXXXX', 19, 0, 19, 3, 15, FontStyle.italic),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                'Details',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 12, 12, 12),
                          child: Text(
                            "__",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 12, 12, 12),
                          child: Text(
                            'Your Activity records',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(15, 12, 12, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new home_progress_card(
                                    Colors.cyan, 'Calorie Burn', 10, 0),
                                new home_progress_card(
                                    Colors.redAccent, 'Workout Progress', 80, 0),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // these card are health related info cards with progress indicators...
                              // the class receives a color for card bg and progress color,
                              // a text as the card title and lastly a progress of the respective action...

                              ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: Text(
                                            'Add necessary input fields here.'),
                                      ),
                                    ),
                                  );
                                },
                                child: Text('Set Calorie Burn Goal'),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.cyan)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: AddWorkout(),
                                      ),
                                    ),
                                  );
                                },
                                child: Text('Set Workout Durations'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.redAccent),
                                ),
                              )
                            ],
                          ),
                        ),
                        //These category will lead to a online article or a youtube video which will show the process of doing particular exercises. [ami
                        // try korci youtube video embed korte,hoynai,partecina,UI chudur budhur kortece, inan kore dis eta]
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 12, 12, 0),
                          child: Text(
                            '$exerciseName Variety',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 12, 12, 12),
                          child: Expanded(
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: .85,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children: <Widget>[
                                CategoryCard(
                                  title: "Strict Pushup",
                                  colorcard: Colors.white,
                                  svgSrc: "assets/icons/pushupicon.svg",
                                  heightofimage: 120,
                                  widthofimage: 120,
                                  press: () {
                                    Navigator.of(context).pushNamed('');
                                  },
                                ),
                                CategoryCard(
                                  title: "Wide Hand Pushup",
                                  colorcard: Colors.white,
                                  svgSrc: "assets/icons/pushup.svg",
                                  heightofimage: 120,
                                  widthofimage: 120,
                                  press: () {
                                    Navigator.of(context).pushNamed('');
                                  },
                                ),
                                CategoryCard(
                                  title: "Diamond Pushup",
                                  colorcard: Colors.white,
                                  svgSrc: "assets/icons/diamondpushup.svg",
                                  heightofimage: 120,
                                  widthofimage: 120,
                                  press: () {
                                    Navigator.of(context).pushNamed('');
                                  },
                                ),
                                CategoryCard(
                                  title: "Power-Clap pushup",
                                  colorcard: Colors.white,
                                  svgSrc: "assets/icons/pushup.svg",
                                  heightofimage: 120,
                                  widthofimage: 120,
                                  press: () {
                                    Navigator.of(context).pushNamed('');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        //this tag is a joke...it's here just to make the UI scrollable. #asthetics XD
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).size.width * .2,
                            width: double.infinity,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

class AddWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newWorkoutGoal = "";
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Workout Duration Time (minutes)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.teal,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newWorkoutGoal = newText;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.teal,
              onPressed: () {
                // Provider.of<TaskData>(context).addTask(newCalGoal);
                print(newWorkoutGoal);
              },
            ),
          ],
        ),
      ),
    );
  }
}
