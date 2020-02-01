import 'package:flutter/material.dart';
import 'package:sliplus/components/themes.dart';

class Modal {
  final BuildContext context;
  Modal({this.context});

  requestStoryTitle(dynamic title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title == '' ? 'Sliplus' : title),
          content: Column(children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 20),
              child: ListView(children: <Widget>[
                Container(
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
                          const BoxConstraints(minHeight: 80, maxHeight: 160),
                      color: AppTheme.white,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 0, bottom: 0),
                        child: TextField(
                          maxLines: 2,
                          maxLength: 100,
                          onChanged: (String txt) {},
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontSize: 16,
                            color: AppTheme.dark_grey,
                          ),
                          cursorColor: AppTheme.nearlyBlue,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Story Title'),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
          actions: <Widget>[
            Container(
                child: Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                hoverColor: AppTheme.nearlyDarkBlue,
                child: Icon(Icons.arrow_forward),
                backgroundColor: AppTheme.nearlyBlue,
                elevation: 0,
                onPressed: () => {},
              ),
            )),
          ],
        );
      },
    );
  }
}
