import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Events_Screen/Pages/EventsScreen.dart';
import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/Podcast_Screen/Pages/PadcastScreen.dart';
import 'package:commerce_app/UI/Profile_Screen/Pages/Porfile.dart';
import 'package:commerce_app/UI/RidoStation_Screen/Pages/RadioStation.dart';
import 'package:flutter/material.dart';




class Buttom_tabs extends StatefulWidget {
  @override
  State<Buttom_tabs> createState() => _MyStatefulButtom_tabs();
}

class _MyStatefulButtom_tabs extends State<Buttom_tabs>{
   // WillPopScope(
  //         onWillPop: () async => false,
  //         child : a
  //         )

int SelectedIndex = 0;
  int dot=0 ;

  @override
  void initState() {
    super.initState();
  }
  List _Screens = [

    Homepage(),
    RadioStation(),
    Podcast(),
    Events(),
    Profile(),
  ];



  @override
  Widget build(BuildContext context) {
     var w = MediaQuery.of(context).size.width;
     var h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body:Stack(
          children: [
            _Screens[SelectedIndex],
            SafeArea(
              child: Container(
                width: w,
                height: h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: constants.blackBack,

                        boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],),


                      width: w,
                      height: h/11,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                dot=0;
                                SelectedIndex = dot;
                                print(dot);


                              });
                            },
                            child: Container(
                              width: w/8,
                              height: h/8,
                              padding: EdgeInsets.only(
                                left: 5
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                      (dot!=0)
                                          ?  constants.blackBack
                                          :  constants.Iconcolor,

                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)
                                      ),
                                    ),
                                    width: w/16,
                                    height: h/210,

                                  ),
                                  SizedBox(height: 1,),
                                  Image.asset("Assets/Images/Home2.png",

                                    color: (dot!=0)
                                        ?  constants.writingONback
                                        :  constants.Iconcolor,
                                  ),
                                      Text("Home",
                                      style: TextStyle(
                                        fontSize: 10,
                                         fontWeight: FontWeight.bold,
                                         color:(dot!=0)
                                             ?  constants.writingONback
                                             :  constants.Iconcolor,


                                      ),
                                      ),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 3,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                dot=1;
                                SelectedIndex = dot;
                                print(dot);

                              });
                            },
                            child: Container(
                              width: w/5.1,
                              height: h/5,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                      (dot!=1)
                                          ?  constants.blackBack
                                          :  constants.Iconcolor,

                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)
                                      ),
                                    ),
                                    width: w/16,
                                    height: h/210,

                                  ),
                                  SizedBox(height: 5,),
                                  Image.asset("Assets/Images/Icon-Radio Stations.png",

                                    color: (dot!=1)
                                        ?  constants.writingONback
                                        :  constants.Iconcolor,
                                  ),
                                  Text("Radio Stations",
                                    style: TextStyle(
                                      letterSpacing: 0.001,
                                      wordSpacing: 0.001,
                                      fontSize: 10.2,
                                      fontWeight: FontWeight.bold,
                                      color:(dot!=1)
                                          ?  constants.writingONback
                                          :  constants.Iconcolor,


                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                dot=2;
                                SelectedIndex = dot;
                                print(dot);
                              });
                            },
                            child: Container(
                            //  color: Colors.green,

                              width: w/5.1,
                              height: h/5,


                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                      (dot!=2)
                                          ?  constants.blackBack
                                          :  constants.Iconcolor,

                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)
                                      ),
                                    ),
                                    width: w/16,
                                    height: h/210,

                                  ),
                                  SizedBox(height: 5,),
                                  Image.asset("Assets/Images/Icon-Podcasts.png", color: (dot!=2)
                                  ?  constants.writingONback
                                      :  constants.Iconcolor,),


                                  Text("Podcasts",

                                    style: TextStyle(

                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color:(dot!=2)
                                          ?  constants.writingONback
                                          :  constants.Iconcolor,


                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                dot=3;
                                SelectedIndex = dot;
                                print(dot);
                              });
                            },
                            child: Container(
                              width: w/5.1,
                              height: h/5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                      (dot!=3)
                                          ?  constants.blackBack
                                          :  constants.Iconcolor,

                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)
                                      ),
                                    ),
                                    width: w/16,
                                    height: h/210,

                                  ),
                                  SizedBox(height: 5,),
                                Image.asset("Assets/Images/Icon-Events.png",
                                    color: (dot!=3)
                                ?  constants.writingONback
                                :  constants.Iconcolor,),


                                  Text("Events_Screen",
                                    style: TextStyle(
                                        fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color:(dot!=3)
                                          ?  constants.writingONback
                                          :  constants.Iconcolor,


                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 3,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                dot=4;
                                SelectedIndex = dot;

                              });
                            },
                            child: Container(
                              width: w/8,
                              height: h/5,
                              padding: EdgeInsets.only(
                                  right: 5
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                      (dot!=4)
                                          ?  constants.blackBack
                                          :  constants.Iconcolor,

                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)
                                      ),
                                    ),
                                    width: w/16,
                                    height: h/210,

                                  ),
                                  SizedBox(height: 5,),
                                  Image.asset("Assets/Images/Icon-Profile.png",
                                  color: (dot!=4)
                                  ?  constants.writingONback
                                      :  constants.Iconcolor,
                                  ),

                                  Text("Profile",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color:(dot!=4)
                                          ?  constants.writingONback
                                          :  constants.Iconcolor,


                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        )


      ),
    );


}

}