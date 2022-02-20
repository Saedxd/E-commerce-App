import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class custombtn extends StatelessWidget {
  final Function onPressed;
  final String textt;
  final bool outlinebtn;
   bool IsLoading = false;

  custombtn({this.textt, this.onPressed, this.outlinebtn,this.IsLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: outlinebtn ? Colors.white : Colors.black,
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Stack(
            children: [
              
              Visibility(
                visible: IsLoading?false :true ,
                child: Center(

                  child: Text(
                    textt,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: outlinebtn ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: IsLoading,
                child: Center(
                  child: SizedBox(
                    width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
