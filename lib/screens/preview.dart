import 'package:sliplus/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PreviewScreen extends StatefulWidget {
  Map<String, dynamic> article;
  PreviewScreen({this.article});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  dynamic id, images, title, body, category, likes, comments, publisgedDat;
  dynamic uid, name, photo, location, isAnounymus;
  final Widget placeholder = Container(color: Colors.grey);
  Map<String, dynamic> article;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

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
      imgList,
      (index, i) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(children: <Widget>[
              Image.network(i, fit: BoxFit.cover, width: 1000.0),
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
        backgroundColor: AppTheme.white,
        iconTheme: IconThemeData(color: AppTheme.nearlyBlue),
        title: Text('Preview', style: TextStyle(color: AppTheme.nearlyBlue)),
        actions: <Widget>[
          
          SizedBox(width: 30,),
            Icon(Icons.remove),
            SizedBox(width: 40,),
            Icon(Icons.plus_one),
            SizedBox(width: 30,),
            
        ],
      ),
      body: Container(
        color: AppTheme.nearlyWhite,
        child: SafeArea(
            top: false,
            child: Column(
              children: <Widget>[

                Container(
                  child: CarouselSlider(
                    items: items,
                    height: MediaQuery.of(context).size.height / 3,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: Duration(seconds: 10),
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/1.9,
                  child: ListView(
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 15.0, left: 15.0, right: 15.0),
                        margin: EdgeInsets.only(
                            top: 2, bottom: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: AppTheme.white,
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
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w500),
                        ),
                      ),

                        Container(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 15.0, left: 15.0, right: 15.0),
                      
                        decoration: BoxDecoration(
                            color: AppTheme.white,
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
                          style: TextStyle(color: AppTheme.darkText),
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
