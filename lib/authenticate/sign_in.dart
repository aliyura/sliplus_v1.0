import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:sliplus/components/themes.dart' ;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  String _mobile = "";
  List<Slide> slides = List();
  bool isFocused = false;
  Country _selected;

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        foregroundImageFit: BoxFit.fill,
        title: "SCHOOL",
        styleTitle: TextStyle(
            color: AppTheme.nearlyBlue,
            fontSize: 30.0,
            fontWeight: FontWeight.bold),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(color:AppTheme.nearlyWhite, fontSize: 20.0),
        pathImage: "assets/images/lady1.jpg",
      ),
    );
    slides.add(
      Slide(
        title: "MUSEUM",
        foregroundImageFit: BoxFit.fill,
        styleTitle: TextStyle(
            color: AppTheme.appColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(color: AppTheme.nearlyWhite, fontSize: 20.0),
        pathImage: "assets/images/lady2.jpg",
      ),
    );
    slides.add(
      Slide(
        foregroundImageFit: BoxFit.fill,
        title: "COFFEE SHOP",
        styleTitle: TextStyle(
            color:AppTheme.appColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(color: AppTheme.nearlyWhite, fontSize: 20.0),
        pathImage: "assets/images/lady3.jpg",
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = List();

    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                currentSlide.pathImage,
              ),
            ),
          ),
          child: Container(
            child: Stack(children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black,
                          ],
                          stops: [
                            0.0,
                            1.0
                          ])),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.grey.withOpacity(0.0),
                                  Colors.black,
                                ],
                                stops: [
                                  0.0,
                                  1.0
                                ])),
                      ),
                      isFocused
                          ? Container()
                          : Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 60),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Center(
                                    child: Text(currentSlide.title,
                                        style: currentSlide.styleTitle),
                                  ),
                                  Center(
                                    child: Text(currentSlide.description,
                                        style: currentSlide.styleDescription),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    padding: EdgeInsets.only(
                                      top: 30,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Help',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text('Privacy & Policy ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                    ],
                  )),
              isFocused
                  ? Container()
                  : Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 70,
                        height: 70,
                        color: Colors.white,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 50, right: 20),
                        child: Image.asset('assets/images/logo.jpg'),
                      ),
                    ),
            ]),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        IntroSlider(
            slides: this.slides,
            // Dot indicator
            colorDot:AppTheme.nearlyBlue,
            sizeDot: 13.0,
            typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
            // Tabs
            listCustomTabs: this.renderListCustomTabs(),
            backgroundColorAllSlides: Colors.white,
            // Show or hide status bar
            shouldHideStatusBar: false,
            isShowSkipBtn: false,
            isShowDoneBtn: false),
        Container(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).size.height / 3),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Form(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            isFocused = true;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          hintStyle:
                              AppTheme.inpuStyle,
                          labelStyle:
                              TextStyle(fontSize: 20.0, color: AppTheme.nearlyBlack,),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color:AppTheme.nearlyBlue),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 30.0, bottom: 20.0, top: 20.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:AppTheme.nearlyBlue),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          prefixIcon: Container(
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                border: Border(
                              right: BorderSide(
                                //                   <--- left side
                                color: Colors.black12,
                                width: 3.0,
                              ),
                            )),
                            child: CountryPicker(
                              dense: false,
                              showFlag: true, //displays flag, true by default
                              showDialingCode:
                                  false, //displays dialing code, false by default
                              showName:
                                  false, //displays country name, true by default
                              showCurrency: false, //eg. 'British pound'
                              showCurrencyISO: true, //eg. 'GBP'
                              onChanged: (Country country) {
                                setState(() {
                                  _selected = country;
                                });
                              },
                              selectedCountry: _selected,
                            ),
                          ),
                        ),
                        cursorColor: Colors.black12,
                        validator: (val) {
                          if (val.length == 0) {
                            return "Mobile Number Cannot be Empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
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
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
