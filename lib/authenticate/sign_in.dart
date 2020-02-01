import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:sliplus/authenticate/homePage.dart';
import 'package:sliplus/components/themes.dart';
import 'package:sliplus/services/database.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String errorMessage = '';
  bool isUserNew = false;
  String phoneNo;
  String smsOTP;
  List<Slide> slides = List();
//GET THE DETAILS OF THE USER[RUN A QUERY IF THE USER EXIST OR NOT ]
  var input1, input2, input3, input_4, input_5, input_6, username;
  String verificationId;

  // FORM STATE GLOBAL VARIABLE
  final _signFormKey = GlobalKey<FormState>();

// OTP AUTO FOCUS PURPOSE
  final FocusNode _fifthInputFocusNode = new FocusNode();
  final FocusNode _firstInputFocusNode = new FocusNode();
  final FocusNode _fourthnputFocusNode = new FocusNode();
  final FocusNode _thirdInputFocusNode = new FocusNode();
  final FocusNode _secondInputFocusNode = new FocusNode();
  final FocusNode _sixthInputFocusNode = new FocusNode();

// firebase instance 
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool isFocused = false;

  Country _selected;

  var MSISDN = '';

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
        styleDescription:
            TextStyle(color: AppTheme.nearlyWhite, fontSize: 20.0),
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
        styleDescription:
            TextStyle(color: AppTheme.nearlyWhite, fontSize: 20.0),
        pathImage: "assets/images/lady2.jpg",
      ),
    );
    slides.add(
      Slide(
        foregroundImageFit: BoxFit.fill,
        title: "COFFEE SHOP",
        styleTitle: TextStyle(
            color: AppTheme.appColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription:
            TextStyle(color: AppTheme.nearlyWhite, fontSize: 20.0),
        pathImage: "assets/images/lady3.jpg",
      ),
    );
  }

// RETURN THE FULL MSISDN INPUTED BY THE USER WITH COUNTRY CODE
  String getFullNumber() {
    //  return the number with the country code
    return "+" + _selected.dialingCode + MSISDN;
  }

// GENERATE CUSTOM OTP FOR OLD USERS PURPOSE
  generateOtp() {
    int minValue = 100000; //min and max values act as your 6 digit range
    int maxValue = 999999;
    var randomizer = new Random();
    int otp = minValue + randomizer.nextInt(maxValue - minValue);
    // print(otp);
    return otp;
  }

// OLD USER LOGIN IS HANDLED HERE
  oldUserLogin() {
    print('old loggin for old user');
    print(getOTP());
    if (getOTP() == '123456') {
      getUser(getFullNumber());
      Navigator.of(context).pop();
    } else {
      print('error loggin for old user');
    }
  }

// GET THE OTP ENTERED BY THE USER
  getOTP() {
    return "$input1" +
        "$input2" +
        "$input3" +
        "$input_4" +
        "$input_5" +
        "$input_6";
  }

  getUser(params) async {
    // get a snapshot of the user collection from the db for the user in question
    DocumentSnapshot snapshot =
        await Firestore.instance.collection('users').document(params).get();

    print(snapshot.data);

// check if the user exist or not
    if (snapshot.data != null) {
      // creatUser(params);
      print('user data available');
      // navigate to otp page before landing page
      Navigator.of(context).pushNamed('/homepage');
    } else {
      print('user data not available');
      Navigator.of(context).pushNamed('/username', arguments: getFullNumber());
    }
  }

  // NEW USER LOGIN IS HANDLE
  newUserLogin() {
    print('new loggin for new user');
    _auth.currentUser().then((user) {
      print(user);
      if (user != null) {
        Navigator.of(context).pop();
      } else {
        signIn();
      }
      getUser(getFullNumber());
    });
  }

  Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      print('$verId, $forceCodeResend');
      smsOTPDialog(context).then((value) {
        print('sign in');
      });
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: getFullNumber(), // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
            if (phoneAuthCredential.toString() ==
                "Instance of 'AuthCredential'") {
              // print('here for old');
              smsOTPDialog(context).then((value) {
                //  getUser(getFullNumber());
                // print('old dialog executed');
              });
              // set the user flag to true
              setState(() {
                this.isUserNew = true;
              });
            } else {
              // set the user flag to true
              setState(() {
                this.isUserNew = false;
              });
              getUser(getFullNumber());
            }
          },
          verificationFailed: (AuthException exceptio) {
            print(exceptio);
            print('${exceptio.message}');
          });
    } catch (e) {
      handleError(e);
    }
  }

  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: getOTP(),
      );
      final FirebaseUser user = await _auth.signInWithCredential(credential);
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    } catch (e) {
      // print('exception');
      handleError(e);
    }
  }

// ERROR HANDLING FOR ALL EXCEPTIONS
  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        smsOTPDialog(context).then((value) {
          // print('sign in');
        });
        break;
         case 'ERROR_SESSION_EXPIRED':
        print(error.message);
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });

        break;
    }
  }


// OTP DIALOG METHOD
  Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Authentication Number!!!'),
            content: Container(
              height: 100,
              child: Column(children: [
                Row(children: <Widget>[
                  SizedBox(
                    height: 40.0,
                    width: 50.0,
                    child: new TextFormField(
                      textAlign: TextAlign.center,
                      // maxLength: 1,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      focusNode: _firstInputFocusNode,
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      // onEditingComplete: () => FocusScope.of(context).requestFocus(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '*',
                      ),
                      onChanged: (value) => {
                        if (value.length == 1)
                          {
                            FocusScope.of(context)
                                .requestFocus(_secondInputFocusNode)
                          },
                        if (value.isNotEmpty)
                          {setState(() => input1 = value)}
                        else
                          {print('error')}
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 50.0,
                    child: new TextFormField(
                        textAlign: TextAlign.center,
                        // maxLength: 1,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        focusNode: _secondInputFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        // onEditingComplete: () => ,
                        decoration: InputDecoration(
                          hintText: '*',
                        ),
                        onChanged: (value) => {
                              if (value.length == 1)
                                {
                                  FocusScope.of(context)
                                      .requestFocus(_thirdInputFocusNode)
                                },
                              if (value.isNotEmpty)
                                {setState(() => input2 = value)}
                              else
                                {print('error')}
                            }),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 50.0,
                    child: new TextFormField(
                        textAlign: TextAlign.center,
                        // maxLength: 1,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        // onEditingComplete: () => FocusScope.of(context).requestFocus(_secondInputFocusNode),
                        focusNode: _thirdInputFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '*',
                        ),
                        onChanged: (value) => {
                              if (value.length == 1)
                                {
                                  FocusScope.of(context)
                                      .requestFocus(_fourthnputFocusNode)
                                },
                              if (value.isNotEmpty)
                                {setState(() => input3 = value)}
                              else
                                {print('error')}
                            }),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 50.0,
                    child: new TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        focusNode: _fourthnputFocusNode,
                        decoration: InputDecoration(
                          hintText: '*',
                        ),
                        onChanged: (value) => {
                              if (value.length == 1)
                                {
                                  FocusScope.of(context)
                                      .requestFocus(_fifthInputFocusNode)
                                },
                              if (value.isNotEmpty)
                                {setState(() => input_4 = value)}
                              else
                                {print('error')}
                            }),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 50.0,
                    child: new TextFormField(
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        keyboardType: TextInputType.number,
                        focusNode: _fifthInputFocusNode,
                        decoration: InputDecoration(
                          hintText: '*',
                        ),
                        onChanged: (value) => {
                              if (value.length == 1)
                                {
                                  FocusScope.of(context)
                                      .requestFocus(_sixthInputFocusNode)
                                },
                              if (value.isNotEmpty)
                                {setState(() => input_5 = value)}
                              else
                                {print('error')}
                            }),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 50.0,
                    child: new TextFormField(
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        focusNode: _sixthInputFocusNode,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '*',
                        ),
                        onChanged: (value) => {
                              if (value.length == 1)
                                {
                                  // FocusScope.of(context).requestFocus(_thirdInputFocusNode)
                                },
                              if (value.isNotEmpty)
                                {setState(() => input_6 = value)}
                              else
                                {print('error')}
                            }),
                  ),
                ]),
                (errorMessage != ''
                    ? Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container())
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              Container(
                  margin: const EdgeInsets.only(right: 30.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: FloatingActionButton(
                          hoverColor: AppTheme.nearlyDarkBlue,
                          child: Icon(Icons.arrow_forward),
                          backgroundColor: AppTheme.nearlyBlue,
                          elevation: 0,
                          onPressed: () =>
                              isUserNew ? oldUserLogin() : newUserLogin()))),
            ],
          );
        });
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
            colorDot: AppTheme.nearlyBlue,
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
              key: _signFormKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: new TextFormField(
                        keyboardType: TextInputType.number,
                        keyboardAppearance: Brightness.dark,
                        onTap: () {
                          setState(() {
                            isFocused = true;
                          });
                        },
                        validator: (value) {
                          // check for empty
                          if (value.isEmpty) {
                            return 'Pls Provide Your Mobile Number :)';
                          } else {
                            // check for the number length
                            if (value.length < 10) {
                              return 'Provide a valid number';
                            } else {
                              return null;
                            }
                          }
                        },
                        onChanged: (value) => MSISDN = value,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          hintStyle: AppTheme.inpuStyle,
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: AppTheme.nearlyBlack,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.nearlyBlue),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 30.0, bottom: 20.0, top: 20.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.nearlyBlue),
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
                                  true, //displays dialing code, false by default
                              showName:
                                  false, //displays country name, true by default
                              showCurrency: false, //eg. 'British pound'
                              showCurrencyISO: false, //eg. 'GBP'
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
                        onPressed: () {
                          verifyPhone();
                        },
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


class UserNamePage extends StatefulWidget{
  var arguments;
  UserNamePage({Key key, this.arguments}) : super(key: key);
  @override
  UserNamePageState createState() => UserNamePageState();

}

class UserNamePageState extends State<UserNamePage> {
  // UserNamePage({Key key, this.arguments}) : super(key: key);

//  GET THE PARAMS PASSED ON THE ROUTE
  get arguments  => widget.arguments;
  var username = '';

  // CREATE THE USER IN FIREBASE
  creatUser(MSISDN) async {
    //  make an instance of the firestore
    final db = Firestore.instance;
    //  get the username and mobile number for posting
    final user = {"name": username, 'MSISDN': MSISDN};

    CollectionReference userRef = db.collection('users');
    await userRef.document(MSISDN).setData(user);
    
  }

   _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        print('$username$arguments');
        creatUser(arguments);
        MaterialPageRoute(builder: (_)=>MyHomePage(title: 'Home Page',));
        Navigator.of(context).pushNamed('/homepage');
      
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Title'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(size: 100),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("We're really keen in knowing you"),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Nazehs Abel',
                    labelText: 'Username',
                    hasFloatingPlaceholder: true),
                onChanged: (value) {
                  this.username = value;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _signInButton()
          ],
        ),
      ),
    );
  }
}
