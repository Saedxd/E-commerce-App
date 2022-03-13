import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/Playback/Pages/Playback.dart';
import 'package:commerce_app/UI/Widgets/Listtiles2.dart';
import 'package:commerce_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class more extends StatefulWidget {


  @override
  _moreState createState() => _moreState();
}
var ctx;

class _moreState extends State<more> {
  Homepage instance = Homepage();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> MoreListTiles = <Widget>[
      ListTilee2(
        IsAboutUs: false,
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {
          print("hello");
          Navigator.pushNamed(context,   "/PLayback",);
        },
        Text1: "Playback",
      ),
      ListTilee2(
        IsAboutUs: false,
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {
          Navigator.pushNamed(context,   "/ConnectDevice",);

        },
        Text1: "Connect to device",
      ),
      ListTilee2(
        IsAboutUs: false,
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {
          Navigator.pushNamed(context,   "/Social",);

        },
        Text1: "Social",
      ),
      ListTilee2(

        IsAboutUs: false,
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {
          Navigator.pushNamed(context,   "/MusicQuality",);
        },
        Text1: "Music Quality",
      ),
      ListTilee2(
        IsAboutUs: false,
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {
          Navigator.pushNamed(context,   "/Aboutus",);





        },
        Text1: "About Us",
      ),

    ];
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: constants.blackBack,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 27,
                      color: constants.pinkColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                Container(
                  child: Text(
                    "More",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/Search");
                    },
                    child: Container(
                      child: Icon(
                        Icons.search,
                        color: constants.writingONback,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 50,
            ),
            Container(
              color: constants.blackBack,
              width: w / 1.03,
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                        height: 5,
                      ),
                  scrollDirection: Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: MoreListTiles.length,
                  itemBuilder: (context, index) {
                    return
                        MoreListTiles[index]; //instance.listtiles[index];
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
