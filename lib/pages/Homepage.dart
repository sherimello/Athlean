import 'package:flutter/material.dart';
import '../widgets/bottomnavbar.dart';
import '../widgets/categorycard.dart';
import '../widgets/searchbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.fromLTRB(19, 19, 19, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/profile');
                      },
                      splashColor: Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          // color: kBlueColor,
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        // child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                  ),
                  Text(
                    "Good Morning \nMr ${user?.displayName}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                  // SearchBar(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 31.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            title: "Healthy Recipes",
                            svgSrc: "assets/icons/Hamburger.svg",
                            press: () {
                              Navigator.of(context).pushNamed('/recipes');
                            },
                          ),
                          CategoryCard(
                            title: "Workout Plan",
                            svgSrc: "assets/icons/Excrecises.svg",
                            press: () {},
                          ),
                          CategoryCard(
                            title: "BMI Calculator",
                            svgSrc: "assets/icons/Meditation.svg",
                            press: () {
                              Navigator.of(context).pushNamed('/bmi_input');
                            },
                          ),
                          CategoryCard(
                            title: "Body Fat Calculator",
                            svgSrc: "assets/icons/yoga.svg",
                            press: () {
                              Navigator.of(context).pushNamed('/fat_input');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
