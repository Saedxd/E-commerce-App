import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/Playback/Pages/Playback.dart';
import 'package:commerce_app/UI/Widgets/MoreListTile.dart';
import 'package:commerce_app/main.dart';
import 'package:flutter/material.dart';


class more extends StatefulWidget {


  @override
  _moreState createState() => _moreState();
}
var ctx;

class _moreState extends State<more> {
  run instance3 = run();
  Homepage instance = Homepage();
  @override
  void initState() {
    super.initState();
    ctx = instance3.navigatorKey.currentState;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> MoreListTiles = <Widget>[
      MoreListTile(
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {
          print("hello");
     //     ctx.pushReplacementNamed( );
          Navigator.pushNamed(context,   "/PLayback",);


        },
        Text1: "Playback",
      ),
      MoreListTile(
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {},
        Text1: "Connect to device",
      ),
      MoreListTile(
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {},
        Text1: "Social",
      ),
      MoreListTile(
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {},
        Text1: "Music Quality",
      ),
      MoreListTile(
        IsPlayBack: false,
        color: constants.mORElistTileColor,
        OnPressed: () {},
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
                    "More",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(//
                    child: Text(
                        "                                                                        ")),
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
                  itemCount: 5,
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
