import 'package:flutter/material.dart';
import 'package:sliplus/components/themes.dart';

class SignPin extends StatefulWidget {
  @override
  _SignPinState createState() => _SignPinState();
}

class _SignPinState extends State<SignPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Enter OTP',
                          style: TextStyle(
                              color: AppTheme.appColor, fontSize: 30)))),
              Divider(),
              SizedBox(height: 40),
              Row(
                children: <Widget>[
                  Container(
                    child: Flexible(
                      child: TextField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        style: AppTheme.inpuStyle,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "0",
                            hintStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                             labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                  ),
                  Container(
                    child: Flexible(
                      child: TextField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        style: AppTheme.inpuStyle,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "0",
                             hintStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                             labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                  ),
                  Container(
                    child: Flexible(
                      child: TextField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        style: AppTheme.inpuStyle,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "0",
                             hintStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                  ),
                  Container(
                    child: Flexible(
                      child: TextField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        style: AppTheme.inpuStyle,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "0",
                             hintStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                             labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                  ),
                ], //widget
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
