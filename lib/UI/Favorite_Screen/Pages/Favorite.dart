import 'package:commerce_app/UI/Widgets/AppBar.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {


  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar(text2: "Favorite",WantSearch: true,WantCart: true,),
    );
  }
}
