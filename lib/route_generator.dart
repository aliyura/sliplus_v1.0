import 'package:flutter/material.dart';
import 'package:sliplus/authenticate/homePage.dart';
import 'package:sliplus/authenticate/sign_in.dart';
import 'package:sliplus/authenticate/sign_pin.dart';
import 'package:sliplus/authenticate/sign_up.dart';
import 'package:sliplus/screens/views/profile.dart';



class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;

      print(settings.name);
      print(args);
    switch (settings.name) {
      case '/signUp':
        if (args is String) {
          print(args);
         return MaterialPageRoute(builder: (_) => SignUp(data:args));
        }
        // return _errorRoute();
        break;

      case '/':
        return MaterialPageRoute(builder: (_) => SignIn());
        break;
      case '/home':
      return MaterialPageRoute(builder:(_)=>ProfileScreen());
      break;
      case '/SignPin':
      return MaterialPageRoute(builder: (_)=> SignPin());
      break;
      case '/otpAuth':
      print(args);
      return MaterialPageRoute(builder: (_)=>MyHomePage(title: 'Mobile Number Authentications',));
      break;
      case '/username':
      return MaterialPageRoute(builder: (_)=> UserNamePage(arguments: args,));
      break;
      case '/homepage':
      return MaterialPageRoute(builder: (_)=>MyHomePage(title: 'Home Page',));
      default:
        return _errorRoute();
    }
  }


//  404 page if the requested page is not found.
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute( builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: new Text('Error'),
        ),
        body: new Center(
          child: new Text('Error!!!!')
        ),
      );
  });
  }
}
