import 'package:commerce_app/UI/TermsOfService/Pages/Terms.dart';
import 'package:commerce_app/UI/Widgets/Listtiles2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AboutUs extends StatefulWidget {

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var auth = FirebaseAuth.instance.currentUser;
  GoogleSignIn googleSignIn;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    List<Widget> ListTiles = <Widget>[
      ListTilee2(
        IsAboutUs: true,
        IsPlayBack: false,
        color: constants.ListtileColor,
        OnPressed: () {
        },
        Text1: "Version",
      ),
      ListTilee2(
        IsAboutUs: true,
        IsPlayBack: false,
        color: constants.ListtileColor,
        OnPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Terms()));
        },
        Text1: "Terms & Conditions",
      ),
      ListTilee2(
        IsAboutUs: true,
        IsPlayBack: false,
        color: constants.ListtileColor,
        OnPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Terms()));
        },
        Text1: "Privacy Policy",
      ),
      ListTilee2(
        IsAboutUs: true,
        IsPlayBack: false,
        color: constants.ListtileColor,
        OnPressed: () {
        },
        Text1: "Support",
      ),
      ListTilee2(
        IsAboutUs: true,
        IsPlayBack: false,
        color: constants.ListtileColor,
        OnPressed: () {
          FirebaseAuth.instance.signOut();


          Navigator.pushNamed(context,   "/login",);
        },
        Text1: "Sign Out",
      ),
    ];
    return Scaffold(
      backgroundColor: constants.blackBack,
      body:SafeArea(
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
                    "About Us",
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
               height: h/1.7,
               child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height:5,),
                  scrollDirection: Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ListTiles.length,
                  itemBuilder: (context, index) {
                    return  ListTiles[index];
                  }),
             ),


          ],
        ),
      ),


    );
  }
}
