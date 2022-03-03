import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Splash_Screen/pages/SplashPage.dart';

class slider extends StatefulWidget {
  User user;
  slider({this.user});

  @override
  _sliderState createState() => _sliderState(user: user);
}

class _sliderState extends State<slider> {
  int dot = 0;
  User user;
  _sliderState({this.user});
  @override
  Widget build(BuildContext context) {
   var heightPage = MediaQuery.of(context).size.height / 1;
   var widthpage =  MediaQuery.of(context).size.width / 1;
   var heightImage = MediaQuery.of(context).size.height / 2;
   var widthImage =  MediaQuery.of(context).size.width / 1.2;
    return Scaffold(
      body:
        SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: widthpage,
                height: heightPage,
                child: PageView.builder(
                    onPageChanged: (int index) {
                      setState(() {
                        dot = index;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  child: Image.asset(
                                    (dot == 0)
                                        ? 'Assets/Images/logo1.png'
                                        : (dot == 1)
                                            ? 'Assets/Images/logo2.jpg'
                                            : 'Assets/Images/logo3.png',
                                    height: heightImage,
                                    width: widthImage,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  // width: MediaQuery.of(context).size.width / 1.2,
                                  child: Text(
                                    (dot == 0)
                                        ? 'Hmada Qunoo'
                                        : (dot == 1)
                                            ? 'Mohammed Qunoo'
                                            : 'MMMM QQQQ',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      // fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 300,
                                  child: Text(
                                    (dot == 0)
                                        ? 'Hmada Qunoo Hmada Qunoo Hmada Qunoo Hmada Qunoo Hmada Qunoo Hmada Qunoo'
                                        : (dot == 1)
                                            ? 'Mohammed Qunoo'
                                            : 'MMMM QQQQ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      // fontFamily: 'Montserrat',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ));
                    }),
              ),
              Positioned(
                bottom: 30,
                left: 10,
                right: 10,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (dot != 0)
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  dot -= 1;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : Container(
                              child: Text("                "),
                            ),
                      Container(
                        child: Row(children: [
                          CircleAvatar(
                            radius: (dot == 0)
                                ? 8
                                : (dot == 0)
                                    ? 5
                                    : 5,
                            backgroundColor: (dot == 0)
                                ? Colors.black
                                : (dot == 1)
                                    ? Colors.amber
                                    : Colors.amber,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          CircleAvatar(
                            backgroundColor: (dot == 1)
                                ? Colors.black
                                : (dot == 0)
                                    ? Colors.amber
                                    : Colors.amber,
                            radius: (dot == 1)
                                ? 8
                                : (dot == 0)
                                    ? 5
                                    : 5,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          CircleAvatar(
                            backgroundColor: (dot == 2)
                                ? Colors.black
                                : (dot == 0)
                                    ? Colors.amber
                                    : Colors.amber,
                            radius: (dot == 2)
                                ? 8
                                : (dot == 0)
                                    ? 5
                                    : 5,
                          ),
                        ]),
                      ),
                      if ((dot == 0) || (dot == 1))
                        InkWell(
                          onTap: () {
                            setState(() {
                              dot += 1;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      else
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context,
                                user != null
                                ?  (FirebaseAuth.instance.currentUser.emailVerified
                                     ?"/Buttom_tabs"
                                     : "/login"
                                  )
                                : "/login"

                            );
                            user != null
                                ? ((!FirebaseAuth.instance.currentUser.emailVerified)
                                   ?  FirebaseAuth.instance.currentUser.delete()
                                    : print("no user found")
                            )
                            : print("to login page");


                            },
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Start",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                     ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  }
}
