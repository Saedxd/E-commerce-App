import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
class ListTilee2 extends StatefulWidget {
  String Text1;
  Function OnPressed;
  Color color;
  bool IsAboutUs;
  bool IsPlayBack;
  ListTilee2({this.OnPressed,this.Text1,this.color,this.IsPlayBack,this.IsAboutUs});


  @override
  _ListTilee2State createState() => _ListTilee2State();
}

class _ListTilee2State extends State<ListTilee2> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  InkWell(
      onTap:  widget.OnPressed,
      child:

      Container(
            width: w/1.1,
            height: h/10,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [BoxShadow(
                color: widget.color,
                spreadRadius: 0.4,
                blurRadius: 0.1,
                offset: Offset(0, 1), // changes position of shadow
              ),],
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("   ${widget.Text1} ", style: TextStyle(
                      color: constants.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ), ),
                  widget.IsAboutUs
                      ?Text("")
                      :widget.IsPlayBack

                    ?Container(
                     margin: EdgeInsets.symmetric(horizontal: 10),
                     child: FlutterSwitch(

                       // activeTextColor:Colors.red,

                       activeColor: constants.blackBack,

                       inactiveColor:constants.blackBack,
                       activeToggleColor:constants.pinkOnBack ,
                       toggleColor: status?constants.pinkOnBack:constants.writingONback,
                       width: w/10.0,
                       height: h/40.0,
                     valueFontSize: 25.0,


                      toggleSize: w/20,
                       value: status,
                       borderRadius: 20.0,
                       padding: 0.0,
                       showOnOff: false,
                       onToggle: (val) {
                         setState(() {
                           status = val;
                         });
                       },
                     ),
                   )
                    :InkWell(
                      onTap: widget.OnPressed,
                      child: Container(
                      width: 80,
                      height: 50,
                      child: FittedBox(
                      child: Image.asset("Assets/Images/arrow.png",

                      ),
                      ),
                      ),
                      )
                ],
              ),




      ),
    );
  }
}
