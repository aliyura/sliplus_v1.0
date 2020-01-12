import 'package:flutter/material.dart';
import 'package:sliplus/components/article_card.dart';
import 'package:sliplus/components/themes.dart';
import 'package:sliplus/dummy/article_dummy_data.dart' as dummy;

class StoriesScreen extends StatefulWidget {
  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  
   Map<String, dynamic>  article;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 55),
      color: AppTheme.background,
      child:ListView(
        shrinkWrap: true,
        children: <Widget>[
            //ArticleCard(article: dummy.singleArticle),
            ArticleCard(article: dummy.oneArticle),
            ArticleCard(article: dummy.twoArticle),
            ArticleCard(article: dummy.threeArticle),
            ArticleCard(article: dummy.fourArticle),
            ArticleCard(article: dummy.fiveArticle),
            ArticleCard(article: dummy.sixArticle),
        ],
      ),
    );
  }
}
