import 'dart:async';

import 'package:athlean/network%20classes/Sqlite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    var name = "", cal = "kkk";
    final TextEditingController _typeAheadController = TextEditingController();

    return Column(
      children: [
        Text(
          cal,
          style: TextStyle(color: Colors.white),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(29.5),
            ),
            child: Row(children: [
              Flexible(
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                      autofocus: false,
                      controller: _typeAheadController,
                      style: DefaultTextStyle.of(context).style.copyWith(
                          fontStyle: FontStyle.italic, color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder())),
                  suggestionsCallback: (pattern) async {
                    return await new SQLite().foodNames();
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      leading: Icon(Icons.fastfood),
                      title: Text(suggestion.toString()),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _typeAheadController.text = suggestion.toString();
                    name = suggestion.toString();
                    new SQLite().foodCalorie(name).then((String val) {
                      cal = val;
                    });
                  },
                ),
              ),
              InkWell(
                onTap: () {

                  new SQLite().initUserDataEntry(name, int.parse(cal));
                  _typeAheadController.text = cal;

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(cal),
                  ));
                  //
                },
                child: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                ),
              )
            ])
        ),
      ],
    );
  }
}
