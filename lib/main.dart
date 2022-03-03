import 'package:commerce_app/UI/ChangePassword/pages/ChangePass.dart';

import 'package:commerce_app/UI/Login_Screen/pages/Login_Page.dart';

import 'package:commerce_app/UI/Playback/Pages/Playback.dart';
import 'package:commerce_app/UI/Search_Screen/Pages/SearchScreen.dart';
import 'package:commerce_app/UI/Splash_Screen/pages/SplashPage.dart';
import 'package:commerce_app/UI/VerfiyScreen/Pages/VerfiyScreen.dart';
import 'package:commerce_app/UI/Widgets/Buttom_Taps.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:commerce_app/UI/SignUp_Screen/pages/SignUp.dart';
import 'UI/Home_Screen/page/home_Page.dart';
import 'UI/slider_Screen/pages/slider.dart';
import 'package:flutter/services.dart';
import 'package:commerce_app/UI/More_Screen/Pages/more.dart';
// New Knowledge is

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();


  runApp(run());
}

class run extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      // onGenerateRoute: generateRoute,
        navigatorKey: navigatorKey,



        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
        // Navigator.of(context).push(
//             //     MaterialPageRoute(builder: (context) => CookieDetail(
//             //         assetPath: imgPath,
//             //         cookieprice:price,
//             //         cookiename: name
//             //     )));
      //  USE this when you click on something and shows a details screen about it
        //of throw a constructor.

        initialRoute: "/Splash",
        routes: {
          "/register": (context) => SignUp(),
          "/PLayback": (context) => Playback(),
          "/login": (context) => Login(),
         "/homePage": (context) => Homepage(),
         "/Search": (context) => SearchScreen(),
          "/Splash": (context) => MyApp(),
          "/Buttom_tabs": (context) => Buttom_tabs(),
          "/slider_Screen": (context) => slider(),
          "/Verfiy": (context) => VerifyScreen(),
         "/ChangePass": (context) => ChangePass(),
         "/More": (context) => more(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),

    );
  }
}
