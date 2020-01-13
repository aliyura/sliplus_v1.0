import 'package:flutter/material.dart';
import 'package:sliplus/components/search_card.dart';
import 'package:sliplus/dummy/article_dummy_data.dart' as dummy;
import 'package:sliplus/components/themes.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _value;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 60),
      color: AppTheme.background,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
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
                  color: AppTheme.white,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 0),
                    child: TextField(
                      maxLines: 1,
                      onChanged: (String txt) {},
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontSize: 16,
                        color: AppTheme.dark_grey,
                      ),
                      cursorColor: AppTheme.nearlyBlue,
                      decoration: InputDecoration(
                          prefix: DropdownButton<String>(
                            underline: SizedBox(),
                            style: TextStyle(
                              color: AppTheme.nearlyBlack,
                              fontSize: 18.0,
                            ),
                            items: [
                                 DropdownMenuItem(
                                value: "1",
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Default",
                                      style: TextStyle(
                                        color: AppTheme.nearlyBlack,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Users",
                                      style: TextStyle(
                                        color: AppTheme.nearlyBlack,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "3",
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Articles",
                                      style: TextStyle(
                                        color: AppTheme.nearlyBlack,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            },
                            hint: Text(
                              'Default',
                              style: TextStyle(color: AppTheme.nearlyBlack),
                            ),
                            value: _value,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search User/Article'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.4,
            child: ListView(
              children: <Widget>[
                // SearchCard(article:dummy.userSearchResponse),
                //  SearchCard(article:dummy.userSearchResponse),

                SearchCard(article: dummy.articleSearchResponse),
                SearchCard(article: dummy.articleSearchResponse),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
