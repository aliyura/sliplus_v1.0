import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sliplus/components/themes.dart';

class SignUp extends StatefulWidget {
 const  SignUp({Key key, this.data}): super(key: key);

  final String data;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var username;

// get the route params from the previous page using getters
  get data => widget.data;
// final String  username;
 void creatUser(MSISDN) async {
  //  make an instance of the firestore
       final db = Firestore.instance;
      //  get the username and mobile number for posting
    final  user = {
        "name":username,
        'MSISDN':MSISDN
      };

    CollectionReference  userRef= db.collection('users');
    await userRef.document(MSISDN).setData(user); 
     Navigator.of(context).pushNamed('/home');
     
} 
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        
        // padding: EdgeInsets.all(20),
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
                 onChanged: (value) => {
                   setState(()=>  username = value),
                   print(username)
                 },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 20),
              Container(
                  child: Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  hoverColor: AppTheme.nearlyDarkBlue,
                  child: Icon(Icons.arrow_forward),
                  backgroundColor: AppTheme.nearlyBlue,
                  elevation: 0,
                  onPressed: () => {
                    // print('final pressed'),
                    // Navigator.of(context).pushNamed('/home'),
                    creatUser(data)
                  },
                ),
              )),
            ]),
            // onChanged: () => {},
      ),
    );
  }
}
