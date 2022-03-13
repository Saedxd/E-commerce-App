import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MusicQuality extends StatefulWidget {

  @override
  _MusicQualityState createState() => _MusicQualityState();
}

class _MusicQualityState extends State<MusicQuality> {
  bool status = false;
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
                        "Music Quality",
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
            InkWell(
          onTap:  (){},
          child:

          Container(
            width: w/1.04,
            height: h/10,
            decoration: BoxDecoration(
              color: constants.ListtileColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [BoxShadow(
                color: constants.ListtileColor,
                spreadRadius: 0.4,
                blurRadius: 0.1,
                offset: Offset(0, 1), // changes position of shadow
              ),],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("     Streaming", style: TextStyle(
                    color: constants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ), ),
                Text("Version 0.01   ", style: TextStyle(
                    color: constants.writingONback,
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                ), ),

                //
                //     Container(
                //   margin: EdgeInsets.symmetric(horizontal: 10),
                //   child: FlutterSwitch(
                //
                //     // activeTextColor:Colors.red,
                //
                //     activeColor: constants.blackBack,
                //     inactiveColor:constants.blackBack,
                //     activeToggleColor:constants.pinkOnBack ,
                //     toggleColor: status?constants.pinkOnBack:constants.writingONback,
                //     width: w/10.0,
                //     height: h/40.0,
                //     valueFontSize: 25.0,
                //     toggleSize: w/20,
                //     value: status,
                //     borderRadius: 20.0,
                //     padding: 0.0,
                //     showOnOff: false,
                //     onToggle: (val) {
                //       setState(() {
                //         status = val;
                //       });
                //     },
                //   ),
                // ),
                //     InkWell(
                //   onTap: (){},
                //   child: Container(
                //     width: 80,
                //     height: 50,
                //     child: FittedBox(
                //       child: Image.asset("Assets/Images/arrow.png",
                //
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),




          ),
        ),
            SizedBox(
              height: 7,
            ),
            InkWell(
          onTap:  (){},
          child:

          Container(
            width: w/1.04,
            height: h/10,
            decoration: BoxDecoration(
              color: constants.ListtileColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [BoxShadow(
                color: constants.ListtileColor,
                spreadRadius: 0.4,
                blurRadius: 0.1,
                offset: Offset(0, 1), // changes position of shadow
              ),],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("   Download using cellular", style: TextStyle(
                    color: constants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ), ),


                    Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: FlutterSwitch(

                    // activeTextColor:Colors.red,

                    activeColor: constants.blackBack,
                    inactiveColor:constants.blackBack,
                    activeToggleColor:constants.pinkOnBack ,
                    toggleColor: status?constants.pinkOnBack:constants.writingONback,
                    width: w/10.0,
                    height: h/40.0,
                    valueFontSize: 25.0,
                    toggleSize: w/20,
                    value: status,
                    borderRadius: 20.0,
                    padding: 0.0,
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
                ),
                //     InkWell(
                //   onTap: (){},
                //   child: Container(
                //     width: 80,
                //     height: 50,
                //     child: FittedBox(
                //       child: Image.asset("Assets/Images/arrow.png",
                //
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),




          ),
        ),
            SizedBox(
              height: 7,
            ),
             InkWell(
          onTap:  (){},
          child:

          Container(
            width: w/1.04,
            height: h/10,
            decoration: BoxDecoration(
              color: constants.ListtileColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [BoxShadow(
                color: constants.ListtileColor,
                spreadRadius: 0.4,
                blurRadius: 0.1,
                offset: Offset(0, 1), // changes position of shadow
              ),],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("    Equalizer", style: TextStyle(
                    color: constants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ), ),

                //
                //     Container(
                //   margin: EdgeInsets.symmetric(horizontal: 10),
                //   child: FlutterSwitch(
                //
                //     // activeTextColor:Colors.red,
                //
                //     activeColor: constants.blackBack,
                //     inactiveColor:constants.blackBack,
                //     activeToggleColor:constants.pinkOnBack ,
                //     toggleColor: status?constants.pinkOnBack:constants.writingONback,
                //     width: w/10.0,
                //     height: h/40.0,
                //     valueFontSize: 25.0,
                //     toggleSize: w/20,
                //     value: status,
                //     borderRadius: 20.0,
                //     padding: 0.0,
                //     showOnOff: false,
                //     onToggle: (val) {
                //       setState(() {
                //         status = val;
                //       });
                //     },
                //   ),
                // ),
                //     InkWell(
                //   onTap: (){},
                //   child: Container(
                //     width: 80,
                //     height: 50,
                //     child: FittedBox(
                //       child: Image.asset("Assets/Images/arrow.png",
                //
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),




          ),
        ),
            SizedBox(
              height: 7,
            ),
          ],
        ),
      ),
    );
  }
}
