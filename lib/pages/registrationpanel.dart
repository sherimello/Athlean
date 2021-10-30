import 'package:flutter/material.dart';
import '../widgets/color.dart';


class Reg_fields extends StatelessWidget {
  const Reg_fields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: new InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.black54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: orangy),
                    ),

                    labelText: 'username',
                    hintStyle: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.w600),
                    labelStyle: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w600),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: orangy,
                    ),
                    suffixStyle: const TextStyle(color: orangy)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: new InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.black54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: orangy),
                    ),
                    hintText: 'sherimello@xyz.com',
                    labelText: 'email',
                    hintStyle: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.w600),
                    labelStyle: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w600),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: orangy,
                    ),
                    suffixStyle: const TextStyle(color: orangy)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: new InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.black54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: orangy),
                    ),
                    hintText: '*******',
                    labelText: 'password',
                    hintStyle: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.w600),
                    labelStyle: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w600),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: orangy,
                    ),
                    suffixStyle: const TextStyle(color: orangy)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(13, 8, 13, 8),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          color: orangy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.black,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 13, 8),
                      child: Text(
                        "  Register  ",
                        style: TextStyle(
                          fontSize: 17,
                          color: orangy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
