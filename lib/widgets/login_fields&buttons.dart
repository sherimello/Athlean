import 'package:flutter/material.dart';

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
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(width: 1.5, color: Colors.black54)),
                  focusedBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(width: 2, color: Colors.paste)),
                  hintText: 'sherimello@xyz.com',
                  labelText: 'email',
                  hintStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w600),
                  labelStyle: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w600),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.paste,
                  ),
                  suffixStyle: const TextStyle(color: Colors.paste)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              decoration: new InputDecoration(
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(width: 1.5, color: Colors.black54)),
                  focusedBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(width: 2, color: Colors.paste)),
                  hintText: '*******',
                  labelText: 'password',
                  hintStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w600),
                  labelStyle: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w600),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.paste,
                  ),
                  suffixStyle: const TextStyle(color: Colors.paste)),
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
                      color: Colors.paste,
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
                        color: Colors.paste,
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
