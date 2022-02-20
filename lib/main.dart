import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/Login_Screen/pages/Login_Page.dart';
import 'package:commerce_app/UI/Splash_Screen/pages/SplashPage.dart';
import 'package:commerce_app/UI/Widgets/Buttom_Taps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:commerce_app/UI/Register_Screen/pages/Register.dart';
import 'UI/slider/pages/slider.dart';
import 'package:flutter/services.dart';
// New Knowledge is

void main() {
  runApp(run());
}

class run extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      initialRoute: "/Splash",
      routes: {
        "/register": (context) => Register(),
        "/login": (context) => Login(),
        "/homePage": (context) => HomePage(),
        "/Splash": (context) => MyApp(),
        "/Buttom_tabs": (context) => Buttom_tabs(),
        "/slider": (context) => slider(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
