import 'package:flutter/material.dart';
import 'package:sliplus/components/themes.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            height: MediaQuery.of(context).size.height / 2,
            color: AppTheme.nearlyBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        backgroundImage:
                            ExactAssetImage('assets/images/avatar.jpg'),
                        minRadius: 70,
                        maxRadius: 90,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(left: 150),
                        child: CircleAvatar(
                          backgroundColor: AppTheme.white,
                          minRadius: 30,
                          maxRadius: 30,
                          child: Icon(Icons.photo_camera),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 4),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Aisha Yahaya',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.nearlyWhite,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '+2348000000000',
                        style: TextStyle(
                          color: AppTheme.nearlyWhite,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      FlatButton.icon(
                        color: AppTheme.nearlyWhite,
                        icon: Icon(Icons.mode_edit,color: AppTheme.nearlyBlack,),
                        label: Text('Edit Profile'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8, left: 4),
            color: AppTheme.nearlyWhite,
            height: MediaQuery.of(context).size.height / 2.5,
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  color: AppTheme.white,
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Shatu_2014'),
                  ),
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  color: AppTheme.nearlyWhite,
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Shatu@gmail.com'),
                  ),
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  color: AppTheme.white,
                  child: ListTile(
                    leading: Icon(Icons.add_location),
                    title: Text('Lagos, Nigeria'),
                  ),
                ),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
