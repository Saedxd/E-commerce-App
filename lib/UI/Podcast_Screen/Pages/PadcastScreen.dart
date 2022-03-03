import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';

class Podcast extends StatefulWidget {
  @override
  _PodcastState createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.blackBack,

      body: SafeArea(
          child: Text("Podcast_Screen"),

      ),
    );
  }
}
