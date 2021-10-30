import 'package:athlean/widgets/color.dart';
import 'package:flutter/material.dart';


class login_page_header extends StatelessWidget {

  const login_page_header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "\u{1F536}  welcome to AthLean",
            style: TextStyle(
              fontSize: 27,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Divider(
              thickness: 1.5,
              height: 10,
              color: Colors.white54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: Text(
              "AthLean is a platform designed to aid you in getting rid of what you want to shed...\nthose nasty fats!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13,8,13,8),
                child: InkWell(
                  onTap: (){
                    //launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html'); add url_launcher header file above.
                  },
                  child: Text(
                    "learn more",
                    style: TextStyle(
                      fontSize: 17,
                      color: orangy,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/registration');
                },
                child: Card(
                  color: orangy,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(13,8,13,8),
                    child: Text(
                      "   sign up   ",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
