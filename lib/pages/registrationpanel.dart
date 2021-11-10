import 'package:flutter/material.dart';
import '../widgets/color.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reg_fields extends StatefulWidget {
  @override
  State<Reg_fields> createState() => _Reg_fieldsState();
}

class _Reg_fieldsState extends State<Reg_fields> {

  String userName = "";
  String userEmail = "";
  String userPassword = "";

  final FirebaseAuth auth = FirebaseAuth.instance;

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
                onChanged: (value) {
                  userName = value;
                },
                decoration: new InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.black54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: orangy),
                    ),
                    labelText: 'Full name',
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
                    child: GestureDetector(
                      onTap: () {
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
                      child: GestureDetector(
                        onTap: () async {
                          try {
                            UserCredential userCredential =
                                await auth.createUserWithEmailAndPassword(
                              email: userEmail,
                              password: userPassword,
                            );
                            // await newUser.user!.updateDisplayName(userName);
                            await userCredential.user!.updateProfile(displayName: userName);
                            Navigator.of(context).pushNamed('/home');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
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
