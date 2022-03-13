import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';

class ListTilee extends StatefulWidget {
  String imagePath;
  Function onPressed;
  String text;
  String text2;
  Color TILECOLOR;
  ListTilee({this.onPressed,this.imagePath,this.text,this.text2,this.TILECOLOR});

  @override
  _ListTileeState createState() => _ListTileeState();
}

class _ListTileeState extends State<ListTilee> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: widget.TILECOLOR,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),

          ),
        ),

        child: ListTile(
          leading: Image.asset("${widget.imagePath}"),
          title : Text('${widget.text}',
            style: TextStyle(
                color: constants.white,
                fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text("${widget.text2}",
            style: TextStyle(
                color: constants.writingONback,
                fontWeight: FontWeight.bold
            ),),



        ),
      ),
    );
  }
}
