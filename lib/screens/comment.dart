import 'package:sliplus/components/themes.dart';
import 'package:sliplus/components/flat_article_card.dart';
import 'package:sliplus/components/comment_card.dart';
import 'package:nice_button/nice_button.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  final Map<String, dynamic> article;
  CommentScreen({this.article});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  ScrollController _commentListController = new ScrollController();
  Map<String, dynamic> article;
  dynamic id, title, comments;

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
    title = article['title'];
    comments = article['statistic']['comments'];
    comments != null ? comments = int.parse(comments) : comments = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        iconTheme: IconThemeData(color: AppTheme.nearlyBlue),
        title: Text('$title', style: TextStyle(color: AppTheme.nearlyBlue)),
      ),
      body: Container(
          color: AppTheme.nearlyWhite,
          padding: EdgeInsets.only(bottom: 15),
          child: ListView(
            controller: _commentListController,
            children: <Widget>[
              FlatArticleCard(article: article),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(15),
                color: AppTheme.background,
                child: comments > 0
                    ? CommentsCard()
                    : Center(child: Text('No Comments')),
              ),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        offset: const Offset(4, 4),
                        blurRadius: 8),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    constraints:
                        const BoxConstraints(minHeight: 80, maxHeight: 300),
                    color: AppTheme.white,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 0),
                      child: TextField(
                        maxLines: 5,
                        maxLength: 1000000,
                        onChanged: (String txt) {},
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontSize: 16,
                          color: AppTheme.dark_grey,
                        ),
                        cursorColor: AppTheme.nearlyBlue,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type your Comment'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: NiceButton(
                    width: 150,
                    elevation: 1.0,
                    radius: 25.0,
                    text: "Send",
                    background: AppTheme.nearlyBlue,
                    onPressed: () {
                      print("hello");
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
