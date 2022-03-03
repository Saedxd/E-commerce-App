import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Splash_Screen/pages/SplashPage.dart';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class slider extends StatefulWidget {


  @override
  _sliderState createState() => _sliderState();
}

class _sliderState extends State<slider> {
  int dot = 0;




  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: w,
                height: h,
                color: constants.blackBack,
              ),
              Container(
                width: w,
                height: h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Image.asset("Assets/Images/gg1.png"),
                  ],
                ),
              ),
              Container(

                width: w,
                height: h,
                child: PageView.builder(
                    onPageChanged: (int index) {
                      setState(() {
                        dot = index;
                      });
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(""),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                       Container(
                         child: Text(
                           (dot == 0)
                           ?"Tune your Radio0"
                           :(dot == 1)
                               ?"Ridia or living1"
                               :(dot == 2)
                                    ?"Ridia or living2"
                                    :"Ridia or living3",
                           style: TextStyle(color: Colors.white
                           ,fontSize: 22,
                             fontWeight: FontWeight.bold
                           ),

                         ),),
                       Container(
                         height: w/2,
                         width: w/1.3,
                         child: Center(
                           child: Text(
                               (dot == 0)
                                   ?"SDSADSADSADSADSASAD12121212"
                                   :(dot == 1)
                                   ?"Ridia or SDSADSADSADSADSASAD12121212"
                                   :(dot == 2)
                                   ?"Ridia SDSADSADSADSADSASAD12121212 living2"
                                   :"SDSADSADSADSADSASAD12121212 or living3",


                             style: TextStyle(color: constants.writingONback
                             ,fontSize: 15,
                               fontWeight: FontWeight.bold
                             ),

                           ),
                         ),
                       ),
                              Spacer(),



                      ]
                      )
                      );
                    }),
              ),
              Container(
               // color: Colors.white,
                child: Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      print("lol");
                      setState(() {
                        Navigator.pushReplacementNamed(context, "/login");
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                          right: 9,
                          top: 9,
                        ),
                        child: Text(
                          "Skip",
                          style:
                          TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w700, fontSize: 18),
                        )),
                  ),
                ),
              ),
              Container(child: (dot != 3)
                  ? Positioned(
                bottom: w / 12,
                right: w / 40,
                child: InkWell(
                  onTap: () {
                    print("lol");
                    print(dot);
                    setState(() {
                      if (dot < 3 && dot > -1) dot += 1;
                    });
                  },
                  child: Container(
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.pinkAccent,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      )),
                ),
              )
                  : Positioned(
                bottom: w / 12,
                right: w / 40,
                child: InkWell(
                  onTap: () {

                   Navigator.pushReplacementNamed(context,"/login");
                  },
                  child: Container(
                      child: Text(
                        "Start",
                        style: TextStyle(color: Colors.pinkAccent,
                            fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ),
              ),),
              Container(
                child: Positioned(
                    bottom: w / 10,
                    right: w / 2.3,
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: (dot != 0)
                                      ? Colors.black
                                      : constants.pinkOnBack,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                CircleAvatar(
                                  backgroundColor: (dot != 1)
                                      ? Colors.black
                                      : constants.pinkOnBack,
                                  radius: 5,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                CircleAvatar(
                                  backgroundColor: (dot != 2)
                                      ? Colors.black
                                      : constants.pinkOnBack,
                                  radius: 5,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: (dot != 3)
                                      ? Colors.black
                                      : constants.pinkOnBack,
                                ),
                              ]),
                            ),
                          ]),
                    )),
              ),
              Container(child:
              (dot == 0)
                  ? Text("")
                  : Positioned(
                bottom: w / 12,
                left: w / 40,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (dot <= 3 && dot >= -1) dot -= 1;
                      print(dot);
                    });
                    print("lol");
                  },
                  child: Container(
                      child: Text(
                        "Previous",
                        style:
                        TextStyle(color: Colors.pinkAccent,
                            fontWeight: FontWeight.w700,

                            fontSize: 18),
                      )),
                ),
              ),),

            ],
          ),
        ),
      ),
    );
  }
}
//  Center(
//                               child: Container(
//                                 // width: MediaQuery.of(context).size.width / 1.2,
//                                 child: Text(
//                                   (dot == 0)
//                                       ? 'Hmada Qunoo'
//                                       : (dot == 1)
//                                       ? 'Mohammed Qunoo'
//                                       : 'MMMM QQQQ',
//                                   style: TextStyle(
//                                     fontSize: 25,
//                                     color: Colors.black,
//                                     // fontFamily: 'Montserrat',
//                                   ),
//                                 ),
//                               ),
//                             ),
//  Center(
//                               child: Container(
//                                 width: 300,
//                                 child: Text(
//                                   (dot == 0)
//                                       ? 'Hmada Qunoo Hmada Qunoo Hmada Qunoo Hmada Qunoo Hmada Qunoo Hmada Qunoo'
//                                       : (dot == 1)
//                                       ? 'Mohammed Qunoo'
//                                       : 'MMMM QQQQ',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.black,
//                                     // fontFamily: 'Montserrat',
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
// Positioned(
//               bottom: 30,
//               left: 10,
//               right: 10,
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     (dot != 0)
//                         ? InkWell(
//                       onTap: () {
//                         setState(() {
//                           dot -= 1;
//                         });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.only(right: 10),
//                         child: Text(
//                           "Back",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     )
//                         : Container(
//                       child: Text("                "),
//                     ),
//                     Container(
//                       child: Row(children: [
//                         CircleAvatar(
//                           radius: (dot == 0)
//                               ? 8
//                               : (dot == 0)
//                               ? 5
//                               : 5,
//                           backgroundColor: (dot == 0)
//                               ? Colors.black
//                               : (dot == 1)
//                               ? Colors.amber
//                               : Colors.amber,
//                         ),
//                         SizedBox(
//                           width: 2,
//                         ),
//                         CircleAvatar(
//                           backgroundColor: (dot == 1)
//                               ? Colors.black
//                               : (dot == 0)
//                               ? Colors.amber
//                               : Colors.amber,
//                           radius: (dot == 1)
//                               ? 8
//                               : (dot == 0)
//                               ? 5
//                               : 5,
//                         ),
//                         SizedBox(
//                           width: 2,
//                         ),
//                         CircleAvatar(
//                           backgroundColor: (dot == 2)
//                               ? Colors.black
//                               : (dot == 0)
//                               ? Colors.amber
//                               : Colors.amber,
//                           radius: (dot == 2)
//                               ? 8
//                               : (dot == 0)
//                               ? 5
//                               : 5,
//                         ),
//                       ]),
//                     ),
//                     if ((dot == 0) || (dot == 1))
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             dot += 1;
//                           });
//                         },
//                         child: Container(
//                           padding: EdgeInsets.only(right: 10),
//                           child: Text(
//                             "Next",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       )
//                     else
//                       InkWell(
//                         onTap: () {
//
//
//
//                         },
//                         child: Container(
//                           padding: EdgeInsets.only(right: 10),
//                           child: Center(
//                             child: Text(
//                               "Start",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             )
