import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class custombtn extends StatelessWidget {
  final Function onPressed;
  final String textt;
  final Color btnColor;
  final Color TxtColor;
  final Color outlineColor;
  final bool IsGoogle;
  final bool WantImage;
  final bool WantBig;


  bool IsLoading = false; // on this code we must learn how we can benifit
  // from it to make the Heart go red or white in cards

  custombtn({
    this.WantBig,
    this.WantImage,
    this.IsGoogle,
    this.textt,
    this.onPressed,
    this.IsLoading,
    this.btnColor,
    this.outlineColor,
    this.TxtColor
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: height/13,
          width: width/1.1,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: btnColor, //btnColor ? Colors.pink : Colors.black,
            border: Border.all(
              color: outlineColor, //outlinebtn ?  Colors.black: Colors.pink,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Stack(
            children: [


              Visibility(
                visible: IsLoading ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WantImage?
                    (
                    IsGoogle
                   ? Image.asset("Assets/Images/Google.png")
                   : Image.asset("Assets/Images/Facebook.png")
                    )
                    :Text(""),
                    SizedBox(width: 10,),
                    Text(
                    textt,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,

                        fontSize:  WantBig
                            ?20
                            :14,



                        color: TxtColor
                      //textcolor ? Colors.white : Colors.white,
                    ),

                  )

                  ],

              ),
              ),
              Visibility(
                visible: IsLoading,
                child: Center(
                  child: SizedBox(
                    width: width/ 15,
                    height: height/ 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),

            ],
          )),
    );
  }
}
//fix signing up in empty fields
