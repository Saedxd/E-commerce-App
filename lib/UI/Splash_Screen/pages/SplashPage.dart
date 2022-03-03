import 'package:commerce_app/UI/Login_Screen/pages/Login_Page.dart';
import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/Splash_Screen/pages/SplashPage.dart';
import 'package:commerce_app/UI/Widgets/Buttom_Taps.dart';
import 'package:commerce_app/UI/slider_Screen/pages/slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:commerce_app/UI/Splash_Screen/pages/SplashPage.dart';

class MyApp extends StatefulWidget {
  @override
  _MyyAppState createState() => _MyyAppState();
}

class _MyyAppState extends State<MyApp> {
  User _user;
  void WaitFirebaseAuth()async{
     _user =  await FirebaseAuth.instance.currentUser;
  }

  Future<FirebaseApp> initilization =  Firebase.initializeApp();

  @override
  void initState() {
    delay();
    print('delay has started .');
    print(_user);
    super.initState();
    WaitFirebaseAuth();
  }

  void delay() {
    Future.delayed(Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => _user != null ? slider() : slider(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: FutureBuilder(
          future: initilization,
          builder: (context, snapshot) {
            //builds the firebase

            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("Error accuried : $snapshot"),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return StreamBuilder(
                  // Streambuilder checks the login state live
                  stream: FirebaseAuth.instance.authStateChanges(),
                  //this keeps track of auth state
                  builder: (context, streamSnapshot) {
                    // if StreamSnapshot has an error
                    if (streamSnapshot.hasError) {
                      return Scaffold(
                        body: Center(
                          child: Container(
                              child: Text("Error accuried :$streamSnapshot")),
                        ),
                      );
                    }
                    if (streamSnapshot.connectionState ==
                        ConnectionState.active) {
                      //get the user
                      _user = streamSnapshot.data;
                      //user is null here
                      // looks like we gonna take info from .data
                      // if user null then user not logged in , go to login page
                      return Scaffold(
                        // the screen thaty the user sees.
                        body: SafeArea(
                            child: Stack(
                          children: [
                            Container(
                              width: w,
                              height: h,
                              color: constants.blackBack,
                            ),



                                 Positioned(
                                   left: 0,
                                   right: 0,
                                   top: 0,
                                   bottom: 0,
                                      child: Container(
                                          child: Image.asset(
                                              'Assets/Images/LOGO121.png')),

                             ),

                          ],
                        )),
                      );
                    }
                    return Container(
                      width: 2,
                      height: 2,
                    );
                  });
            }
            return Container(
              width: 2,
              height: 2,
            );
          }),
    );
  }
}
