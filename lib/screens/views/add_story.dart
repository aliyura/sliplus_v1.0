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
         margin: EdgeInsets.only(bottom:50),
      child: ListView(children: <Widget>[
        Container(
          child: Container(
            color: AppTheme.white,
            width: double.infinity,
            padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
            child: Container(
              alignment: Alignment.bottomRight,
              width: 200,
              child: DropdownButton<String>(
                underline: SizedBox(),
                style: TextStyle(
                  color: AppTheme.nearlyBlack,
                  fontSize: 18.0,
                ),
                items: [
                  DropdownMenuItem(
                    value: "1",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.image),
                        SizedBox(width: 10),
                        Text(
                          "Add Image",
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.videocam),
                        SizedBox(width: 10),
                        Text(
                          "Add Video",
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
                hint:Text('Add Attachement',style: TextStyle(
                    color: AppTheme.nearlyBlack
                  ),),
                value: _value,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: AppTheme.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  offset: const Offset(4, 4),
                  blurRadius: 8),
            ],
          ),
          child: Container(
            child: Center(child: Text('No File Selected')),
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom:20),
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
                          border: InputBorder.none, hintText: 'Story Title'),
                    ),
                  ),
                ),
              ),
            ),
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
                  constraints:
                      const BoxConstraints(minHeight: 80, maxHeight: 300),
                  color: AppTheme.white,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 0),
                    child: TextField(
                      maxLines: 10,
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
        )
      ]),
    );
  }
}
