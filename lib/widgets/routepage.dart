import 'package:flutter/material.dart';
import '../pages/login&reg.dart';
import '../pages/registrationpanel.dart';
import '../pages/Homapage.dart';


class RoutePage{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){

      case '/login':
        return MaterialPageRoute(builder: (_)=>login());
      case '/registration':
        return MaterialPageRoute(builder: (_)=>Reg_fields());
      case '/home':
        return MaterialPageRoute(builder: (_)=>HomeScreen());
        return _errorRoute();
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





