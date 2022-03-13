import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Widgets/Listtitle.dart';
import 'package:flutter/material.dart';

class ConnectDevice extends StatefulWidget {
  @override
  _ConnectDeviceState createState() => _ConnectDeviceState();
}

class _ConnectDeviceState extends State<ConnectDevice> {
  @override
  Widget build(BuildContext context) {
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
                      color: constants.pinkColor,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  child: Text(
                    "Connect to device",
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
                    onTap: (){ Navigator.pushNamed(context, "/Search");

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
              width: w/1.04,
              height: h/11,
              child: ListTilee(

                TILECOLOR:   constants.ListtileColor,
                imagePath: "Assets/Images/Icon.png",
                text2: "",
                text: "Computer",
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: w/1.04,
              height: h/11,
              child:

              ListTilee(
                TILECOLOR:   constants.ListtileColor,
                imagePath: "Assets/Images/Icon-4.png",
                text2: "",
                text: "TV",
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: w/1.04,
              height: h/11,
              child: ListTilee(

                TILECOLOR:   constants.ListtileColor,
                imagePath: "Assets/Images/Icon-3.png",
                text2: "",
                text: "Wi-Fi Speakers",
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: w/1.04,
              height: h/11,
              child:

              ListTilee(
                TILECOLOR:   constants.ListtileColor,
                imagePath: "Assets/Images/Icon-2.png",
                text2: "",
                text: "Chromecast",
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: w/1.04,
              height: h/11,
              child:

              ListTilee(
                TILECOLOR:   constants.ListtileColor,
                imagePath: "Assets/Images/Icon-1.png",
                text2: "",
                text: "Bluetooth",
                onPressed: () {},
              ),
            ),
          ],

        ),
      ),

    );
  }
}
