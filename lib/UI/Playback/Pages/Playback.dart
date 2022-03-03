import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/More_Screen/Pages/More.dart';
import 'package:commerce_app/UI/Widgets/MoreListTile.dart';
import 'package:commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';

class Playback extends StatefulWidget {


  @override
  _PlaybackState createState() => _PlaybackState();
}

class _PlaybackState extends State<Playback> {
  run instance3 = run();


  Homepage instance = Homepage();
  more instance2 = more();
  @override
  Widget build(BuildContext context) {
    List<Widget> MoreListTiles2 = <Widget>[
      MoreListTile(
        IsPlayBack: true,
        color: constants.ListtileColor,
        OnPressed: () { },
        Text1: "Gapless",
      ),
      MoreListTile(
        IsPlayBack: true,
        color: constants.ListtileColor,
        OnPressed: () {},
        Text1: "Automix",
      ),
      MoreListTile(
        IsPlayBack: true,
        color: constants.ListtileColor,
        OnPressed: () {},
        Text1: "Show Unplayable Songs",
      ),
      MoreListTile(
        IsPlayBack: true,
        color: constants.ListtileColor,
        OnPressed: () {},
        Text1: "Normalize Volume",
      ),
      MoreListTile(
        IsPlayBack: true,
        color: constants.ListtileColor,
        OnPressed: () {},
        Text1: "Autoplay",
      ),
      MoreListTile(
        IsPlayBack: true,
        color: constants.ListtileColor,
        OnPressed: () {},
        Text1: "Canvas",
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                  child: SizedBox(
                    width: 5,
                  ),
                ),
                Container(
                  child: Text(
                    "Playback",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    child: Text("                                                           ")),
                Container(
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/Search");
                    },
                    child: Container(
                      child:Icon(
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
              width: w/1.03,
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                        height: 5,
                      ),
                  scrollDirection: Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: MoreListTiles2.length,
                  itemBuilder: (context, index) {
                    return MoreListTiles2[index];
                    //instance.listtiles[index];
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
