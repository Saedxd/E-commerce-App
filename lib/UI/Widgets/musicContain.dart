

import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MusicContain extends StatefulWidget {
  String imagePath;
  Function onPressed;
  String text;
  String text2;
  bool WantText= false;// ALso used for want favorit
  MusicContain({this.onPressed,this.imagePath,this.text,this.text2,this.WantText});


  @override
  _MusicContainState createState() => _MusicContainState();
}

class _MusicContainState extends State<MusicContain> {


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
      return Stack(
        children: [
          InkWell(
          onTap: widget.onPressed,
          child: Container(


            width: w/3,
            height: h/5,

            decoration: BoxDecoration(
             // color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),

              ),
            ),
            child: Column(

              children: [
                Container(
                 // color: Colors.red,
                  width: w/3,
                  height: h/6.5,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset("${widget.imagePath}",
                    ),
                  ),
                ),
                widget.WantText
                    ? Column(
                  children: [
                    Text("${widget.text}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    Text("${widget.text2}",
                      style: TextStyle(
                        color: constants.writingONback,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,

                      ),
                    ),

                  ],
                )
                    :SizedBox(width: 0,height: 0,),

              ],
            ),
            // image: DecorationImage(
            //
            //  fit: BoxFit.fill,
            //  child : SvgPicture.asset("Assets/Images/Image-2.svg",

            //),

            // ),

          )

      ),
         widget.WantText
       ?  SizedBox(width: 0,height: 0,)
          : Positioned(
            top: w/30,
            right: w/30,
            child: IconButton(icon: Icon(
                Icons.favorite,
              color: Colors.red[900],


            ), onPressed: (){

            }),
          ),

        ],
      );







    }

}