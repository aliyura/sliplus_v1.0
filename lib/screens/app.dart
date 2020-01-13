import 'package:flutter/material.dart';
import 'package:sliplus/components/drawer.dart';
import 'package:sliplus/components/themes.dart';
import 'package:sliplus/models/tab_icons_model.dart';
import 'package:sliplus/components/bottom_bar.dart';
import 'package:sliplus/screens/views/add_story.dart';
import 'package:sliplus/screens/views/favorite.dart';
import 'package:sliplus/screens/views/stories.dart';
import 'package:sliplus/screens/views/profile.dart';
import 'package:sliplus/screens/views/search.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen>
   
  with TickerProviderStateMixin {
    AnimationController animationController;
    List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
      _unSelectAllTabs();
      tabIconsList[0].isSelected = true; 
      animationController = AnimationController(
          duration: const Duration(milliseconds: 600), vsync: this);
      tabBody = StoriesScreen();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _unSelectAllTabs(){
    setState(() {
        tabIconsList.forEach((TabIconData tab) {
          tab.isSelected = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          backgroundColor: AppTheme.white,
          iconTheme: IconThemeData(color:  AppTheme.nearlyDarkBlue),
      
          title: Text(
            AppTheme.appName,
            style: TextStyle(color:  AppTheme.nearlyDarkBlue),
          ),
          actions: <Widget>[
            FlatButton.icon(
                focusColor: Colors.transparent,
                icon: Icon(Icons.library_books, color: AppTheme.nearlyDarkBlue),
                label: Text(''),
                onPressed: () {
                  
                }),
            FlatButton.icon(
                focusColor: Colors.transparent,
                icon: Icon(Icons.notifications, color:  AppTheme.nearlyDarkBlue),
                label: Text(''),
                onPressed: () {}),
          ],
        ),
        drawer: Drawer(
          child: NavigationDrawer(iconAnimationController: animationController),
        ),
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            setState(() {
                 _unSelectAllTabs();
                 tabBody =AddStoryScreen();
            });
          },
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =StoriesScreen();
                });
              });
            } 
            else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                   tabBody =FevoriteStoriesScreen();
                });
              });
            }
            else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                   tabBody =SearchScreen();
                });
              });
            }
            else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                   tabBody =ProfileScreen();
                });
              });
            }
          },
        ),
      ],
    );
  }
}
