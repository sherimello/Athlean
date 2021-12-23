import 'package:athlean/pages/profile.dart';
import 'package:athlean/pages/Homepage.dart';
import 'package:athlean/pages/workout.dart';
import 'package:athlean/pages/workoutsSession/ExercisePage.dart';
import 'package:athlean/widgets/HealthyRecipes.dart';
import 'package:athlean/widgets/desc_screen.dart';
import 'package:flutter/material.dart';
import 'package:athlean/pages/bmi_input_page.dart';
import 'package:athlean/pages/fat_input_page.dart';
import '../pages/workoutsSession/ExercisePage.dart';
import '../pages/login&reg.dart';
import '../pages/registrationpanel.dart';

class RoutePage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => login());
      case '/registration':
        return MaterialPageRoute(builder: (_) => Reg_fields());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => profile());
      case '/bmi_input':
        return MaterialPageRoute(builder: (_) => BmiInputPage());
      case '/fat_input':
        return MaterialPageRoute(builder: (_) => FatInputPage());
      case '/pushups':
        final String data = settings.arguments.toString();
        print(data);
        return MaterialPageRoute(builder: (context) => Pushups(index: data));

      case '/recipes':
        return MaterialPageRoute(
            builder: (_) => HealthyRecipe(title: "Healthy Recipes"));
      case '/workout':
        return MaterialPageRoute(
            builder: (_) => Workouts(title: "Workouts Resources"));
      case '/meditation':
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(title: "Sleep and Meditation"));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
