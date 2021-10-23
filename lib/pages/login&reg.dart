import 'package:athlean/widgets/login_fields&buttons.dart';
import 'package:athlean/widgets/login_page_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                child: new login_page_header(),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .55 -
                    MediaQuery.of(context).padding.top * 2,
                color: Colors.white,
                child: new login_fields()
              )
            ],
          ),
        ),
      ),
    );
  }
}
