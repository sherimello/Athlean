import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Calorie.dart';

class SQLite {
  var cal = "";

  var calo = <Calorie>[];

  Future<Database> addCal() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'doggie_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE Calories(id INTEGER PRIMARY KEY, foodName TEXT, calorie INTEGER)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }


  Future<Database> addUserFoodInfo() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'doggie_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE UserFoods(id INTEGER PRIMARY KEY, foodName TEXT, calorie INTEGER)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }

  // Define a function that inserts dogs into the database
  Future<void> insertCalorie(Calorie calorie) async {
    // Get a reference to the database.
    final db = await addCal();

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'Calories',
      calorie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Define a function that inserts dogs into the database
  Future<void> insertUser(Calorie calorie) async {
    // Get a reference to the database.
    final db = await addUserFoodInfo();

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'UserFoods',
      calorie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void initDataEntry() async {
    // Create a Dog and add it to the dogs table

    // cal = new List<Calorie>();
    calo.add(Calorie(
      foodName: 'Apple',
      calorie: 350,
    ));

    calo.add(Calorie(
      foodName: 'Orange',
      calorie: 400,
    ));
    calo.add(Calorie(
      foodName: 'Water',
      calorie: 0,
    ));
    calo.add(Calorie(
      foodName: 'Bread per loaf',
      calorie: 392,
    ));
    calo.add(Calorie(
      foodName: 'Butter (1 gm)',
      calorie: 877,
    ));
    calo.add(Calorie(
      foodName: 'Milk (100 mL)',
      calorie: 980,
    ));
    for (int i = 0; i < calo.length; i++) {
      await insertCalorie(calo[i]);
    }
    print(await calories());
  }

  void initUserDataEntry(String foodName, int calorie) async {

      await insertUser(Calorie(
        foodName: foodName,
        calorie: calorie,
      ));
    print(await userFoods());
  }

  Future<List<String>> foodNames() async {
    // Get a reference to the database.
    final db = await addCal();

    final List<Map<String, dynamic>> maps = await db.query(
      'Calories',
    );

    return List.generate(maps.length, (i) {
      return maps[i]['foodName'];
    });
  }

  Future<String> foodCalorie(String name) async {
    // Get a reference to the database.
    var cal = "innannnnnn";
    final db = await addCal();

    final List<Map<String, dynamic>> maps =
        await db.query('Calories', where: "foodName = '$name'");


    List.generate(maps.length, (i) {
      cal = maps[i]['calorie'].toString();
    });
    return cal;
  }

  Future<List<Calorie>> calories() async {
    // Get a reference to the database.
    final db = await addCal();

    final List<Map<String, dynamic>> maps =
        await db.query('Calories', where: "foodName = 'Apple'");

    return List.generate(maps.length, (i) {
      return Calorie(
        foodName: maps[i]['foodName'],
        calorie: maps[i]['calorie'],
      );
    });
  }

  Future<List<Calorie>> userFoods() async {
    // Get a reference to the database.
    final db = await addCal();

    final List<Map<String, dynamic>> maps =
        await db.query('UserFoods');

    return List.generate(maps.length, (i) {
      return Calorie(
        foodName: maps[i]['foodName'],
        calorie: maps[i]['calorie'],
      );
    });
  }
}
