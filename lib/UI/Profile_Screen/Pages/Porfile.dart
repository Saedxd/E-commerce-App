import 'dart:io';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/Widgets/AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User user;
  var auth = FirebaseAuth.instance.currentUser;
  String image2;
  bool selected1 = false;
  bool selected2 = false;

  Future<void> _alreatDialogBuilder() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Choose Between Gallery or Take a photo"),
            content: Container(
              child: Text("you can Use What Ever you Want"),
            ),
            actions: [
              RaisedButton(
                child: Text("Take a photo"),
                onPressed: () {
                  setState(() {
                    selected1 = !selected1;
                    Navigator.pop(context);
                  });
                },
              ),
              SizedBox(
                width: 8,
              ),
              RaisedButton(
                child: Text("Gallery"),
                onPressed: () {
                  setState(() {
                    selected2 = !selected2;
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }

  Future imagePicker(ImageSource source) async {
    try {
      final image2 = await ImagePicker().pickImage(source: source);
      if (image2 == null) return;

      final imagePath = File(image2.path);
      setState(
        () {
          this.image2 = imagePath.toString();

          auth.updatePhotoURL(image2.toString());
        },
      );
    } on PlatformException catch (e) {
      print("failed to select an image");
    }
  }

  //make profil images for each user infirebase stored;
  @override
  void initState() {
    super.initState();
    print(image2);
  }

  Homepage instance = Homepage();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
          slivers: [
        SliverAppBar(
           backgroundColor: constants.blackBack,
          automaticallyImplyLeading: false,
          pinned: false,
          floating: false,
          // snap: false,
          // title: Text(""),
          expandedHeight: 420,

          flexibleSpace: FlexibleSpaceBar(
            //collapseMode: CollapseMode.pin,
            centerTitle: true,
            title: Stack(
                  children: [
                    Positioned(
                      bottom: w / 17,
                      right: w / 11,
                      child: Container(
                        width: w / 2,
                        height: h / 2,
                        child: Center(
                          child: CircleAvatar(
                            radius: 49,
                            backgroundColor: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: w/1.49,
                      right: w/4.2,

                      child: Container(
                        //width: w,
                        //height: h / 2,
                        child: Center(
                          child: Text(
                            auth.displayName,
                            style: TextStyle(
                                color: constants.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: w/2.4,
                      right: w/30,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, "/Search");
                        },
                        child: Container(
                          //  width: 200,
                          height: h/20,

                          child:Icon(
                              Icons.search,
                              color: constants.writingONback,
                              size: 22,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: w/2.4,
                      right: w/10,

                      child: InkWell(
                        onTap: (){ Navigator.pushNamed(context, "/More");},
                        child: Container(
                        //  width: 200,
                            height: h/20,

                            child:Icon(
                              Icons.more_vert,
                              color: constants.writingONback,
                              size: 19,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: w/1.38,
                      right: w/5,
                      child: Container(

                        child: Center(
                          child: Text(
                            auth.email,
                            style: TextStyle(
                                color: constants.writingONback,
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: w/1.28,
                        right: w/2.37,
                child: Container(
                    child: Text(
                      "Favourite Podcasts",
                      style: TextStyle(color: constants.white,
                      fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    ))),
                    Positioned(
                      top: h / 2.4,
                     // left: w/40,
                      child: Container(
                        //  color: Colors.green,
                        width: w,
                        height: h / 4,
                        child: ListView.builder(
                            // separatorBuilder: (BuildContext context, int index) =>
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            scrollDirection: Axis.horizontal,
                            //  physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return instance.Card3[index];
                            }),
                      ),
                    ),
                  ],
                ),
            ),
            ),
        SliverList(
            delegate: SliverChildListDelegate([
      Container(
       // color: constants.blackBack,
        child: Stack(children: [
          Container(
            width: w,
            height: h,
            color: constants.blackBack,
          ),
          Container(
                    color: constants.blackBack,
                    padding: EdgeInsets.only(
                      right: w / 40,
                      left: w / 40,
                      top: w/18
                    ),
                    height: h*20,
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => SizedBox(
                          height: 5,
                        ),
                        scrollDirection: Axis.vertical,
                         physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: false,
                        itemCount: instance.listtiles.length,
                        itemBuilder: (context, index) {
                          return instance.listtiles[index];
                        }),
                  ),
          Positioned(
            right: w/2.2,
            child: Container(
                width: w/2,
                height: 150,

                child: Text(
                  "Favourite Radio Stations",
                  style: TextStyle(color: constants.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold ),)


            ),
          ),
        ],),
      )
        ])),
      ]),
    );
  }
}
// Positioned(
//   bottom: 5,
//   right: 0,
//   child: IconButton(
//     iconSize: 35,
//     icon: Icon(Icons.add_a_photo),
//     color: Colors.pink,
//     onPressed: () async {
//       await _alreatDialogBuilder();
//       selected1 ? imagePicker(ImageSource.camera) : null;
//       selected1 = false;
//       selected2 ? imagePicker(ImageSource.gallery) : null;
//       selected2 = false;
//     },
//   ),
// )
// drawer: Drawer(
//   child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           "Properties",
//           style: constants.RegularHeading,
//         ),
//         RaisedButton(
//             child: Text("Sign Out", style: constants.RegularHeading),
//             onPressed: () {
//               print("user : $auth");
//               FirebaseAuth.instance.signOut();
//               print("user : $auth");
//               Navigator.pushReplacementNamed(context, "/login");
//             }),
//       ]),
// ),
// appBar: Custom_Appbar(text2: "Your Profile", WantSearch: false,WantCart: true,),
//......................................................................................dynamic
//Stack(children: [
//             Container(
//   width: w,
//   height: h,
//   color: constants.blackBack,
// ),
//             Container(
//                 width: w,
//                 height: h/5,
//                 child: Center(
//                   child: CircleAvatar(
//                     radius: 65,
//                     backgroundColor: Colors.black12,
//                   ),
//
//                 ),
//               ),
//             Container(
//               width: w,
//               height: h/2.3,
//               child: Center(
//                 child: Text(
//                   auth.displayName,
//                   style: TextStyle(
//                       color: constants.white,
//                       fontSize: 21,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             Container(
//               width: w,
//               height: h/2,
//               child:
//                   Center(
//                     child: Text(
//                       auth.email,
//                       style: TextStyle(
//                           color: constants.writingONback,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold),
//
//               ),
//                   ),
//             ),
//             Positioned(
//               top: h / 3.2,
//               left: w / 38,
//               child: Container(
//                 //  color: Colors.green,
//                 width: w,
//                 height: h / 4,
//                 child: ListView.builder(
//                   // separatorBuilder: (BuildContext context, int index) =>
//                   //     SizedBox(
//                   //       width: 5,
//                   //     ),
//                     scrollDirection: Axis.horizontal,
//                     // physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 7,
//                     itemBuilder: (context, index) {
//                       return instance.Card3[index];
//                     }),
//               ),
//             ),
//             Positioned(
//                 top: h / 2,
//                 right: w / 2,
//                 child: Container(
//                     child: Text(
//                       "Favourite Radio Stations",
//                       style: TextStyle(color: constants.white,
//                       fontSize: 15,
//                         fontWeight: FontWeight.bold
//                       ),
//                     ))),
//             Positioned(
//                 top: h / 3.5,
//                 right: w / 1.7,
//                 child: Container(
//                     child: Text(
//                       "Favourite Podcasts",
//                       style: TextStyle(color: constants.white,
//                       fontSize: 15,
//                         fontWeight: FontWeight.bold
//                       ),
//                     ))),
//             Positioned(
//               top: h / 1.9,
//               left: w / 40,
//               child:
//               //0B0B15
//
//               Container(
//                 padding: EdgeInsets.only(
//                   right: w / 17,
//                 ),
//                 //  color: Colors.green,
//                 width: w,
//                 height: h / 2.8,
//                 child: ListView.separated(
//                     separatorBuilder: (BuildContext context, int index) => SizedBox(
//                       height: 5,
//                     ),
//                     scrollDirection: Axis.vertical,
//                     // physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 8,
//                     itemBuilder: (context, index) {
//                       return instance.listtiles[index];
//                     }),
//               ),
//             ),
//
//           ])),
