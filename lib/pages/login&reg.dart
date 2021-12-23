import 'package:athlean/widgets/Login&regfield.dart';
import 'package:athlean/widgets/color.dart';
import 'package:athlean/widgets/login_page_header.dart';
import 'package:athlean/widgets/routepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  LRField lrField_login_email =
      new LRField('abc@gmail.com', 'email', Icons.email);
  LRField lrField_login_password =
      new LRField('*******', 'password', Icons.password);

  String userEmail = "";
  String userPassword = "";

  final FirebaseAuth auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RoutePage.generateRoute,
        home: Material(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .45 +
                          MediaQuery.of(context).padding.top,
                      color: Colors.black,
                      child:
                          //this is the UI of the dark area on top of the login page...
                          new login_page_header(),
                    ),
                    Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .55 -
                            MediaQuery.of(context).padding.top * 2,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            lrField_login_email,
                            lrField_login_password,
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(13, 8, 13, 8),
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
                                      setState(() {
                                        showSpinner = true;
                                      });
                                      userEmail =
                                          lrField_login_email.giveEmail();
                                      userPassword =
                                          lrField_login_password.givePassword();

                                      try {
                                        UserCredential userCredential =
                                            await auth
                                                .signInWithEmailAndPassword(
                                          email: userEmail,
                                          password: userPassword,
                                        );
                                        Navigator.of(context)
                                            .pushNamed('/home');
                                        setState(() {
                                          showSpinner = false;
                                        });
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'user-not-found') {
                                          print(
                                              'No user found for that email.');
                                        } else if (e.code == 'wrong-password') {
                                          print(
                                              'Wrong password provided for that user.');
                                        }
                                      }
                                    },
                                    // {
                                    //   userEmail = lrField_login_email.giveEmail();
                                    //   userPassword =
                                    //       lrField_login_password.givePassword();
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(SnackBar(
                                    //     content: Text(
                                    //         userEmail + "    " + userPassword),
                                    //   ));
                                    // },
                                    child: Card(
                                      color: Colors.black,
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1000.0),
                                      ),
                                      elevation: 5,
                                      margin: EdgeInsets.all(10),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            13, 8, 13, 8),
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
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
