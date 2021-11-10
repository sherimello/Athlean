import 'package:athlean/main.dart';
import 'package:athlean/pages/profile.dart';
import 'package:athlean/pages/Homepage.dart';
import 'package:athlean/widgets/HealthyRecipes.dart';
import 'package:athlean/widgets/desc_screen.dart';
import 'package:flutter/material.dart';

import '../pages/login&reg.dart';
import '../pages/registrationpanel.dart';

class RoutePage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => login());
      case '/registration':
        return MaterialPageRoute(builder: (_) => Reg_fields());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => profile());
      case '/recipes':
        return MaterialPageRoute(builder: (_) => HealthyRecipe(title: "Healthy Recipes"));
      case '/meditation':
        return MaterialPageRoute(builder: (_) => DetailsScreen(title: "Sleep and Meditation"));
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
