import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  User LOL = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.blackBack,

      body: SafeArea(
          child: InkWell(
            onTap: (){
              print(LOL);

            },

              child: Text(" Events_Screen")),

      ),
    );
  }
}
