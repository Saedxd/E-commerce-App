import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.blackBack,

      body: SafeArea(
          child: Text(" Events_Screen"),

      ),
    );
  }
}
