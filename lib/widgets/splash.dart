import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/images/athleanLogo.png',
        fit: BoxFit.contain,
        ),
      ),
    );
  }
}
