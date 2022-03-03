
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class constants {
  static const RegularHeading = TextStyle( fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.pink);
  static const boldheadding = TextStyle( fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.black);
  static const  optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.amber);
  static  Color  pinkColor = Color(0xFFF11775);
  static  Color  blackBack = Color(0xFF2D2C3C);
  static  Color  blueF = Color(0xFF39579A);
  static  Color  white = Color(0xFFFFFFFF);
  static  Color  writingONback = Color(0xFF7B7B8B);
  static  Color  pinkOnBack = Color(0xFFFB6580);
  static  Color  textfieldBack = Color(0xFF1D192C);
  static  Color  mORElistTileColor = Color(0xFF0B0B15);
  static  Color  ListtileColor = Color(0xFF181A26);
  static  Color  Cardcolor = Color(0xFF0B0B15);
  static  Color  LightPink = Color(0xFFF11775);
  static  Color  bottombarColor = Color(0xFF181A26);
  static  Color  Iconcolor = Color(0xFFFB6580);
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  static final RegExp numberRegExp = RegExp(r'\d');
  static final RegExp LetterAndNumbers =RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
  static final nameValidation = r"^[\p{Letter}\p{Number}]+$";
  static final emailvalidaition =  r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

}
