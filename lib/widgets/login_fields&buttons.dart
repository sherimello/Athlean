import 'package:flutter/material.dart';
import 'color.dart';


class login_fields extends StatelessWidget {
  const login_fields({Key? key}) : super(key: key);

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
              decoration: new InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.black54),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: CustomColor.orangy),
                  ),
                  hintText: 'sherimello@xyz.com',
                  labelText: 'email',
                  hintStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w600),
                  labelStyle: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w600),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: CustomColor.orangy,
                  ),
                  suffixStyle: const TextStyle(color: CustomColor.orangy)),
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
                    borderSide: BorderSide(width: 1.5, color: CustomColor.orangy),
                  ),
                  hintText: '*******',
                  labelText: 'password',
                  hintStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w600),
                  labelStyle: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w600),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: CustomColor.orangy,
                  ),
                  suffixStyle: const TextStyle(color: CustomColor.orangy)),
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
                      color: CustomColor.orangy,
                      fontWeight: FontWeight.bold,
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
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(13, 8, 13, 8),
                    child: Text(
                      "   sign in   ",
                      style: TextStyle(
                        fontSize: 17,
                        color: CustomColor.orangy,
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
    );
  }
}
