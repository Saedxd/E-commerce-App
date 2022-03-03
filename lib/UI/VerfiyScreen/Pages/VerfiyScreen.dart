import 'dart:async';
import 'package:commerce_app/UI/Widgets/AppBar.dart';
import 'package:commerce_app/UI/Widgets/Buttom_Taps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;
  bool Done = false;

  @override
  void initState() {
    user = auth.currentUser;
    print(user);
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    // as i understood dispose runs when the class navigates to somewhere or when you leave its page or its class somehow.
    print(FirebaseAuth.instance.currentUser.email);
    print(FirebaseAuth.instance.currentUser.emailVerified);
    print(FirebaseAuth.instance.currentUser.displayName);
    timer.cancel();

    //   print("User was deleted From dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height / 3.6;
    var width = MediaQuery
        .of(context)
        .size
        .width / 1.3;
    var heightbutton = MediaQuery
        .of(context)
        .size
        .height / 20;
    var widthbutton = MediaQuery
        .of(context)
        .size
        .width / 3;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Verify your identity"),
          centerTitle: true,
          backgroundColor: Colors.pink[900],
          automaticallyImplyLeading: false,
        ),
        body: Column(children: [
          Center(
            child: Container(
              width: width,
              height: height,
              child: Text(
                'An email has been sent to ${user.email} please verify',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Done
              ? Center(
            child: Container(
              width: width,
              height: height,
              child: Text(
                'Done, Your Just Verified',
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
          )
              : Text(""),
          InkWell(
            onTap: () {
              Navigator.pop(
                context,
              );
              FirebaseAuth.instance.currentUser.delete();
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.amber),
              width: widthbutton,
              height: heightbutton,
              child: Center(
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          )
        ]),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      setState(() {
        Done = true;
      });
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Buttom_tabs()));
    }
  }
}