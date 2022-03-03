import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';

class RadioStation extends StatefulWidget {
  @override
  _RadioStationState createState() => _RadioStationState();
}

class _RadioStationState extends State<RadioStation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.blackBack,

      body: SafeArea(
          child: Text("Rdioa station"),

      ),

    );
  }
}
