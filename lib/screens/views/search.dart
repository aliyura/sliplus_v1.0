import 'package:flutter/material.dart';
import 'package:sliplus/components/article_card.dart';
import 'package:sliplus/dummy/article_dummy_data.dart' as dummy;
import 'package:sliplus/components/themes.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left:10,right: 10,top:10),
            height: 60,
            child: _buildComposer(),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.4,
            child: ListView(
              children: <Widget>[
                ArticleCard(article: dummy.fourArticle),
                ArticleCard(article: dummy.oneArticle),
                ArticleCard(article: dummy.twoArticle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildComposer() {
  return Container(
    decoration: BoxDecoration(
      color: AppTheme.white,
      borderRadius: BorderRadius.circular(5),
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
        constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
        color: AppTheme.white,
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
          child: TextField(
            maxLines: null,
            onChanged: (String txt) {},
            style: TextStyle(
              fontFamily: AppTheme.fontName,
              fontSize: 16,
              color: AppTheme.dark_grey,
            ),
            cursorColor: AppTheme.nearlyBlue,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'Search'),
          ),
        ),
      ),
    ),
  );
}
