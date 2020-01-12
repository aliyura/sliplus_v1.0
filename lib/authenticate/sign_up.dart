import 'package:flutter/material.dart';
import 'package:sliplus/components/themes.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: AppTheme.nearlyBlue, fontSize: 30)))),
              Divider(),
              SizedBox(height: 40),
              TextField(
                obscureText: false,
                style: AppTheme.inpuStyle,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: false,
                style: AppTheme.inpuStyle,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                style: AppTheme.inpuStyle,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "New Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                style: AppTheme.inpuStyle,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 30),
              Container(
                  child: Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  hoverColor: AppTheme.nearlyDarkBlue,
                  child: Icon(Icons.arrow_forward),
                  backgroundColor: AppTheme.nearlyBlue,
                  elevation: 0,
                  onPressed: () => {},
                ),
              )),
            ]),
      ),
    );
  }
}
