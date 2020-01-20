import 'package:sliplus/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:sliplus/config.dart' as config;

class PreviewScreen extends StatefulWidget {
  Map<String, dynamic> article;
  PreviewScreen({this.article});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  ScrollController _scrollController = new ScrollController();
  dynamic id, images, title, body, category, likes, comments, publisgedDat;
  dynamic uid, name, photo, location, isAnounymus;
  final Widget placeholder = Container(color: Colors.grey);
  Map<String, dynamic> article;
  Color backgroundColor = AppTheme.white;
  Color fontColor = AppTheme.nearlyBlack;
  TextAlign textAlign = TextAlign.justify;
  double fontSize = 16;
  double scroll = 0.0;

  @override
  void initState() {
    _initilizeArticle();
    super.initState();
  }

  _initilizeArticle() {
    article = new Map();
    article = widget.article;

    //get  basic article data
    id = article['id'];
    images = article['images'];
    title = article['title'];
    body = article['body'];
    category = article['category'];
    publisgedDat = article['publisgedDat'];

    //get statistic data
    likes = article['statistic']['likes'];
    comments = article['statistic']['comments'];

    //get user details
    uid = article['user']['uid'];
    name = article['user']['name'];
    photo = article['user']['photo'];
    location = article['user']['location'];
    isAnounymus = article['user']['isAnounymus'];
  }

  void alert(message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(config.appName),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showColorDialog() {
    Color selectedColor;

    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: backgroundColor,
            onColorChanged: (color) {
              setState(() {
                selectedColor = color;
              });
            },
            enableLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Apply'),
            onPressed: () {
              setState(() {
                if (selectedColor != null) {
                  backgroundColor = selectedColor;

                  if (backgroundColor != AppTheme.white) {
                    fontColor = AppTheme.nearlyWhite;
                  } else {
                    fontColor = AppTheme.nearlyBlack;
                  }
                }
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    final List items = map<Widget>(
      images,
      (index, i) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(children: <Widget>[
              Image.asset(i, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. $index image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    ).toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
        iconTheme: IconThemeData(color: AppTheme.nearlyBlue),
        title: Text(title, style: TextStyle(color: AppTheme.nearlyBlue)),
        actions: <Widget>[
          SizedBox(
            width: 20,
          ),
          InkWell(
            child: Icon(Icons.remove),
            onTap: () {
              if (fontSize > 16) {
                setState(() {
                  fontSize -= 5;
                });
              }
            },
            onLongPress: () {
              setState(() {
                fontSize = 16;
              });
            },
          ),
          SizedBox(
             width: 30,
          ),
          InkWell(
            child: Icon(Icons.plus_one),
            onTap: () {
              setState(() {
                fontSize += 5;
              });
            },
            onLongPress: () {
              setState(() {
                fontSize += 10;
              });
            },
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        color: AppTheme.nearlyWhite,
        padding: EdgeInsets.only(bottom: 15),
        child: SafeArea(
            top: false,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 2.0),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(15),
                  child: Wrap(
                    children: <Widget>[
                      InkWell(
                        child: Icon(Icons.format_indent_decrease,
                            color: AppTheme.nearlyBlack),
                        onTap: () {
                          setState(() {
                            textAlign = TextAlign.left;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        child: Icon(Icons.format_align_center,
                            color: AppTheme.nearlyBlack),
                        onTap: () {
                          setState(() {
                            textAlign = TextAlign.center;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        child: Icon(Icons.format_align_justify,
                            color: AppTheme.nearlyBlack),
                        onTap: () {
                          setState(() {
                            textAlign = TextAlign.justify;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        child: Icon(Icons.format_indent_increase,
                            color: AppTheme.nearlyBlack),
                        onTap: () {
                          setState(() {
                            textAlign = TextAlign.right;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        child:
                            Icon(Icons.color_lens, color: AppTheme.nearlyBlack),
                        onTap: () {
                          showColorDialog();
                        },
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        child: Icon(Icons.arrow_upward,
                            color: AppTheme.nearlyBlack),
                        onTap: () {
                          scroll = scroll - 30;
                          _scrollController.animateTo(
                            scroll,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                        onLongPress: () {
                          scroll = scroll - 30;
                          _scrollController.animateTo(
                            scroll,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        child: Icon(Icons.arrow_downward,
                            color: AppTheme.nearlyBlack),
                        onTap: () {
                          scroll = scroll + 30;
                          _scrollController.animateTo(
                            scroll,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                        onLongPress: () {
                          scroll = scroll + 30;
                          _scrollController.animateTo(
                            scroll,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: images.length > 0
                      ? CarouselSlider(
                          items: items,
                          height: MediaQuery.of(context).size.height / 3,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: Duration(seconds: 10),
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        )
                      : SizedBox(),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: ListView(
                    controller: _scrollController,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 15.0, left: 15.0, right: 15.0),
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 2.0),
                                blurRadius: 20.0,
                              )
                            ]),
                        child: Text(
                          title,
                          textAlign: textAlign,
                          style: TextStyle(
                              fontSize: 25.0,
                              color: fontColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 15.0, left: 15.0, right: 15.0),
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 2.0),
                                blurRadius: 20.0,
                              )
                            ]),
                        child: Text(
                          body,
                          textAlign: textAlign,
                          style:
                              TextStyle(color: fontColor, fontSize: fontSize),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
