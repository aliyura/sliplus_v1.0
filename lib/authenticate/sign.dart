import 'package:flutter/material.dart';
import 'package:sliplus/authenticate/sign_in.dart';
import 'package:sliplus/authenticate/sign_up.dart';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {

  @override
  Widget build(BuildContext context) {
    return SignIn();
  } 
}