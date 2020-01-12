import 'package:flutter/material.dart';
import 'package:sliplus/components/themes.dart';

class ArticleCard extends StatefulWidget {
  Map<String, dynamic> article;
  ArticleCard({@required this.article});

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  dynamic id, images, title, body, category, likes, comments, publisgedDat;
  dynamic uid, name, photo, isAnounymus;
  Map<String, dynamic> article;

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
    photo = article['user']['photo'];
    isAnounymus = article['user']['isAnounymus'];
  }

  @override
  Widget build(BuildContext context) {
    double grid2Width = MediaQuery.of(context).size.width / 2 - 30;
    double grid3Width = MediaQuery.of(context).size.width / 3 - 24;

    return Container(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 15.0, left: 15.0, right: 15.0),
      margin: EdgeInsets.only(top: 15, bottom: 10, left:10,right: 10),
      decoration: BoxDecoration(
          color: AppTheme.nearlyWhite,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 2.0),
              blurRadius: 20.0,
            )
          ]),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 0),
            constraints: BoxConstraints(minHeight: 70),
            alignment: Alignment.topLeft,
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(photo),
              ),
              title: SizedBox(
                child: Row(children: <Widget>[
                  Text(name,
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
              subtitle:
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(publisgedDat, style: TextStyle(color: Colors.grey)),
                SizedBox(width: 10),
                Icon(
                  Icons.location_on,
                  size: 18,
                ),
                Text('Lagos, Nigeria'),
              ]),
            ),
          ),
          images != null && images.length > 0 && images.length == 1
              ? Container(
                  width: double.infinity,
                  constraints: BoxConstraints(minHeight: 80),
                  child: InkWell(onTap: () {}, child: Image.asset(images[0])),
                )
              : images != null && images.length > 0 && images.length == 2
                  ? Container(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: LimitedBox(
                            maxWidth: double.infinity,
                            maxHeight: 300,
                            child: Wrap(
                              children: <Widget>[
                                Image.asset(images[0], width: grid2Width),
                                SizedBox(width: 10),
                                Image.asset(images[1], width: grid2Width),
                              ],
                            )),
                      ),
                    )
                  : images != null && images.length > 0 && images.length == 3
                      ? Container(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {},
                            child: LimitedBox(
                                maxWidth: double.infinity,
                                maxHeight: 300,
                                child: Wrap(
                                  children: <Widget>[
                                    Image.asset(images[0], width: grid3Width),
                                    SizedBox(width: 10),
                                    Image.asset(images[1], width: grid3Width),
                                    SizedBox(width: 10),
                                    Image.asset(images[2], width: grid3Width),
                                  ],
                                )),
                          ),
                        )
                      : images != null &&
                              images.length > 0 &&
                              images.length == 4
                          ? Container(
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {},
                                child: LimitedBox(
                                    maxWidth: double.infinity,
                                    maxHeight: 300,
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset(images[0],
                                            width: grid2Width),
                                        SizedBox(width: 10),
                                        Image.asset(images[1],
                                            width: grid2Width),
                                        SizedBox(
                                            width: double.infinity, height: 10),
                                        Image.asset(images[2],
                                            width: grid2Width),
                                        SizedBox(width: 10),
                                        Image.asset(images[3],
                                            width: grid2Width),
                                      ],
                                    )),
                              ),
                            )
                          : images != null &&
                                  images.length > 0 &&
                                  images.length == 5
                              ? Container(
                                  width: double.infinity,
                                  child: InkWell(
                                      onTap: () {},
                                      child: LimitedBox(
                                          maxWidth: double.infinity,
                                          maxHeight: 600,
                                          child: Wrap(
                                            children: <Widget>[
                                              Image.asset(images[0],
                                                  width: double.infinity),
                                              SizedBox(
                                                  width: double.infinity,
                                                  height: 10),
                                              Image.asset(images[1],
                                                  width: grid2Width),
                                              SizedBox(width: 10),
                                              Image.asset(images[2],
                                                  width: grid2Width),
                                              SizedBox(
                                                  width: double.infinity,
                                                  height: 10),
                                              Image.asset(images[3],
                                                  width: grid2Width),
                                              SizedBox(width: 10),
                                              Image.asset(images[4],
                                                  width: grid2Width),
                                            ],
                                          ))),
                                )
                              : images != null &&
                                      images.length > 0 &&
                                      images.length == 6
                                  ? Container(
                                      width: double.infinity,
                                      child: InkWell(
                                        onTap: () {},
                                        child: LimitedBox(
                                            maxWidth: double.infinity,
                                            maxHeight: 600,
                                            child: Wrap(
                                              children: <Widget>[
                                                Image.asset(images[0],
                                                    width: grid3Width),
                                                SizedBox(width: 10),
                                                Image.asset(images[1],
                                                    width: grid3Width),
                                                SizedBox(width: 10),
                                                Image.asset(images[2],
                                                    width: grid3Width),
                                                SizedBox(
                                                    height: 10,
                                                    width: double.infinity),
                                                Image.asset(images[3],
                                                    width: grid3Width),
                                                SizedBox(width: 10),
                                                Image.asset(images[4],
                                                    width: grid3Width),
                                                SizedBox(width: 10),
                                                Image.asset(images[5],
                                                    width: grid3Width),
                                              ],
                                            )),
                                      ),
                                    )
                                  : Container(
                                      width: 0,
                                      height: 0,
                                    ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              title,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
            ),
          ),
          body == '' || body == null || body == 'null'
              ? Container(
                  width: 0,
                  height: 0,
                )
              : Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        body,
                        style: TextStyle(color: AppTheme.darkText),
                      ),
                    )
                  ],
                ),
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: <Widget>[

                        Text('$likes',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),), Text('Likes'),
                        SizedBox(width: 20),
                        
                        Text('$comments',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),), Text('Comments'),

                        SizedBox(width: 10),

                        Expanded(
                          child: Icon(
                            Icons.comment,
                            size: 25,
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.favorite,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}