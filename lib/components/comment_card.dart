import 'package:flutter/material.dart';
import 'package:sliplus/components/themes.dart';
import 'package:sliplus/dummy/article_dummy_data.dart' as dummy;

class CommentsCard extends StatefulWidget {
  @override
  _CommentsCardState createState() => _CommentsCardState();
}

class _CommentsCardState extends State<CommentsCard> {
  dynamic id, body, publisgedDat;
  dynamic uid, name, photo, location, isAnounymus;
  dynamic commentBody, commentedDate;
  dynamic comment, comments = [];
  bool isLast = false;

  @override
  void initState() {
    _initilizeArticle();
    super.initState();
  }

  _initilizeArticle() {
    comments.add(dummy.articleComment);
    comments.add(dummy.articleComment);
    comments.add(dummy.articleComment);
    comments.add(dummy.articleComment);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (BuildContext ctxt, int index) {
            comment = comments[index];

            if (index == (comments.length)-1) {
              isLast = true;
            }
            //get  basic article data
            id = comment['id'];
            body = comment['body'];
            publisgedDat = comment['publisgedDat'];

            //get user details
            uid = comment['user']['uid'];
            name = comment['user']['name'];
            photo = comment['user']['photo'];
            location = comment['user']['location'];
            isAnounymus = comment['user']['isAnounymus'];
            return Container(
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              decoration: BoxDecoration(
                color: AppTheme.background,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 0),
                constraints: BoxConstraints(minHeight: 70),
                alignment: Alignment.topLeft,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(photo),
                    backgroundColor: AppTheme.nearlyBlue,
                  ),
                  title: SizedBox(
                    child: Row(children: <Widget>[
                      Text(name,
                          style: TextStyle(
                              color: AppTheme.darkerText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ]),
                  ),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(publisgedDat,
                                    style: TextStyle(color: Colors.grey)),
                              ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(body)),
                        ),
                        isLast
                            ? SizedBox(height: 10)
                            : Align(
                                alignment: Alignment.bottomLeft,
                                child: Image.asset('assets/images/figma.png',height: 20,),
                              )
                      ]),
                ),
              ),
            );
          }),
    );
  }
}
