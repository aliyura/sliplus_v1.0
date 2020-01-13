import 'package:flutter/material.dart';
import 'package:sliplus/components/themes.dart';

class SearchCard extends StatefulWidget {
  Map<String, dynamic> article;
  SearchCard({@required this.article});

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  dynamic id, image, title, publisgedDat;
  dynamic uid, name, photo, location, isAnounymus;
  bool isUser = false;
  Map<String, dynamic> article;

  @override
  void initState() {
    _initilizeArticle();
    super.initState();
  }

  _initilizeArticle() {
    article = new Map();
    article = widget.article;

    if (article.containsKey('type')) {
      switch (article['type']) {
        case "user":
          uid = article['uid'];
          name = article['name'];
          photo = article['photo'];
          location = article['location'];
          isAnounymus = article['isAnounymus'];
          isUser = true;
          break;
        case "article":
          id = article['id'];
          image = article['image'];
          title = article['title'];
          publisgedDat = article['publisgedDat'];
          isUser = false;
          break;
      }
    } else {
      print('Bad Response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(top: 10.0, bottom: 15.0, left: 15.0, right: 15.0),
      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
      decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 2.0),
              blurRadius: 20.0,
            )
          ]),
      child: isUser
          ? Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 0),
                  constraints: BoxConstraints(minHeight: 70),
                  alignment: Alignment.topLeft,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 0),
                    leading: Image.asset(photo, width: 50, height: 50),
                    title: SizedBox(
                      child: Row(children: <Widget>[
                        Text(name == '' ? 'Unknown' : name,
                            style: TextStyle(
                                color: AppTheme.darkerText,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Container(
                          child: CircleAvatar(
                            maxRadius: 6.0,
                            backgroundColor: AppTheme.nearlyBlue,
                          ),
                        ),
                      ]),
                    ),
                    subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.location_on,
                            size: 18,
                          ),
                          Text(location),
                        ]),
                  ),
                )
              ],
            )
          : Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 0),
                  constraints: BoxConstraints(minHeight: 70),
                  alignment: Alignment.topLeft,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 0),
                    leading: Image.asset(image, width: 50, height: 50),
                    title: SizedBox(
                      child: Row(children: <Widget>[
                        Flexible(
                          child: Text(title,
                              style: TextStyle(
                                  color: AppTheme.darkerText,
                                  fontSize: 20,)),
                        ),
                      ]),
                    ),
                    subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(publisgedDat,
                              style: TextStyle(color: Colors.grey)),
                        ]),
                  ),
                )
              ],
            ),
    );
  }
}
