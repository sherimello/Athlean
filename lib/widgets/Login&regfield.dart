import 'package:flutter/material.dart';

import 'color.dart';

class LRField extends StatefulWidget {
  // const LRField({Key? key}) : super(key: key);
  var hint, label;
  var userEmail = "";
  var userPassword = "";
  IconData iconData;

  LRField(this.hint, this.label, this.iconData);

  String giveEmail() {
    return userEmail;
  }

  String givePassword() {
    return userPassword;
  }

  @override
  State<LRField> createState() => _LRFieldState();
}

class _LRFieldState extends State<LRField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            widget.label == 'email'
                ? widget.userEmail = value
                : widget.userPassword = value;
          });
        },
        decoration: new InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.black54),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: orangy),
            ),
            hintText: widget.hint,
            labelText: widget.label,
            hintStyle:
                TextStyle(color: Colors.black38, fontWeight: FontWeight.w600),
            labelStyle:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
            prefixIcon: Icon(
              widget.iconData,
              color: orangy,
            ),
            suffixStyle: const TextStyle(color: orangy)),
      ),
    );
  }
}
