import 'package:flutter/material.dart';
import 'package:sliplus/components/themes.dart';
import 'package:nice_button/nice_button.dart';

class AddStoryScreen extends StatefulWidget {
  @override
  _AddStoryScreenState createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  String _value;
  bool _bool = false;
  void _valueChanged(bool value) => setState(() => _bool = value);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: ListView(children: <Widget>[
        SizedBox(height: 15),
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
              constraints: const BoxConstraints(minHeight: 80, maxHeight: 300),
              color: AppTheme.white,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 0, bottom: 0),
                child: TextField(
                  maxLines: 15,
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
                      hintText: 'Type or Paste your Story'),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        CheckboxListTile(
          value: false,
          onChanged: _valueChanged,
          title: Text('Keep me Anonymous'),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.red,
        ),
        SizedBox(height: 15),
        Container(
          child: Align(
            alignment: Alignment.bottomRight,
            child: NiceButton(
              width: 150,
              elevation: 1.0,
              radius: 25.0,
              text: "Review",
              background: AppTheme.nearlyBlue,
              onPressed: () {
                print("hello");
              },
            ),
          ),
        ),
      ]),
    );
  }
}
