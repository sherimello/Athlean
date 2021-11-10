import 'package:flutter/material.dart';


class profile_header_user_info_text extends StatelessWidget {

  var text;
  double paddingL = 0, paddingT = 0, paddingR = 0, paddingB = 0, fonstSize = 0;
  FontStyle fontStyle = FontStyle.normal;

  profile_header_user_info_text(
      this.text,
      this.paddingL,
      this.paddingT,
      this.paddingR,
      this.paddingB,
      this.fonstSize,
      this.fontStyle);

  // const profile_header_user_info_text.dart({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.fromLTRB(paddingL, paddingT, paddingR, paddingB),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: fonstSize,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            color: Colors.black38,
          ),
        ),
      );
  }
}
