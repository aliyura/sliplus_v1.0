import 'package:flutter/material.dart';
import 'package:sliplus/components/article_card.dart';
import 'package:sliplus/dummy/article_dummy_data.dart' as dummy;
import 'package:sliplus/components/themes.dart';

class FevoriteStoriesScreen extends StatefulWidget {
  @override
  _FevoriteStoriesScreenState createState() => _FevoriteStoriesScreenState();
}

class _FevoriteStoriesScreenState extends State<FevoriteStoriesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 55),
      color: AppTheme.nearlyWhite,
      child:ListView(
        shrinkWrap: true,
        children: <Widget>[
            ArticleCard(article: dummy.oneArticle),
            ArticleCard(article: dummy.twoArticle),
            ArticleCard(article: dummy.fiveArticle),
        ],
      ),
    );
  }
}
