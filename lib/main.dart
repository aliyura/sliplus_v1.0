import 'package:flutter/material.dart';
import 'package:sliplus/authenticate/sign_in.dart';
import 'package:sliplus/init.dart';
import 'package:sliplus/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
        // home: AppInit(),
        home: AppInit(),
        onGenerateRoute: RouterGenerator.generateRoute
    );
  }
}
