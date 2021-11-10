import 'package:flutter/material.dart';
import 'color.dart';
import 'package:firebase_auth/firebase_auth.dart';


class login_fields extends StatefulWidget {
  const login_fields({Key? key}) : super(key: key);

  @override
  State<login_fields> createState() => _login_fieldsState();
}

class _login_fieldsState extends State<login_fields> {

  String userEmail = "";
  String userPassword = "";

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value) {
                userEmail = value;
              },
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
              onChanged: (value) {
                userPassword = value;
              },
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
                  child: Text(
                    "forgot password?",
                    style: TextStyle(
                      fontSize: 17,
                      color: orangy,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      UserCredential userCredential = await auth.signInWithEmailAndPassword(
                          email: userEmail,
                          password: userPassword,
                      );
                      Navigator.of(context).pushNamed('/home');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  child: Card(
                    color: Colors.black,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13, 8, 13, 8),
                      child: Text(
                        "   sign in   ",
                        style: TextStyle(
                          fontSize: 17,
                          color: orangy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
