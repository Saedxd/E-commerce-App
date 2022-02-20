import 'package:commerce_app/DataBase/Database.dart';
import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/Widgets/Buttom_Taps.dart';
import 'package:commerce_app/UI/Widgets/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Widgets/Custom_btn.dart';
import 'package:flutter/services.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool ISloading = false;
  String _loginEmail = " ";
  String _LoginPass = " ";

  Future<void> _alreatDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [ RaisedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ) ],


          );
        });
  }
  Future<String> _SignInAccount() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _loginEmail, password: _LoginPass);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else
        return "Your credentials are incorrect or have expired. Please try again";
    } catch (e) {
      return " exception : $e";
    }
  }
  void SubmitForm() async {
    //Sets the button to loading state...
    setState(() { ISloading = true;});


    String LoginAccountFeedBack =  await _SignInAccount(); // calls the createaccount function

    // if the String not Null we have an error , so we call _alreatDialog and pass the error as a perameter.
    if (LoginAccountFeedBack != null) {
      _alreatDialogBuilder(LoginAccountFeedBack);
      setState(() {
        ISloading = false;
      });
    }
    else {
      setState(() {
        ISloading = false;
      });
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => Buttom_tabs()),
      );
      print("done");
    }
      // THE RETURN TYPE IS null so user is "Good" and head our way to the homepage.
    }


  // FocusNode _PasswordFocusNode;
  // @override
  // void initState() { ///////////////part 4 (14:0) youtube video
  //   // TODO: implement initState
  //   super.initState();
  //   _PasswordFocusNode = FocusNode();
  // }
  //===============================================>> HOW CAN I USE DISPOSE METHOD AND WHY
  // @override
  // void dispose() {
  //   super.dispose();
  //   // TODO: implement dispose
  //   _PasswordFocusNode.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  " Welcome User \n Login to Your Account ",
                  style: constants.boldheadding,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                child: Column(
                  children: [
                    textfeild(
                      Onsubmitted: (value) {
                        // when click on submit btn pass info
                        _loginEmail = value;
                        // _PasswordFocusNode.requestFocus();
                      },
                      Text2: "Email",
                      isEMAIL: true,
                      Onchanged: (value) {
                        _loginEmail = value;
                      },
                      TextInputaction: TextInputAction.next,
                    ),
                    textfeild(
                      Text2: "Password",
                      isEMAIL: false,
                      Onsubmitted: (value) {
                        // when click on submit btn pass info
                        SubmitForm();
                      },
                      Onchanged: (value) {
                        _LoginPass = value;
                      },
                      // FoucesNode: _PasswordFocusNode,
                    ),
                    custombtn(
                      textt: "Login",
                      //this text of the button passed to the custombtn function
                      onPressed: () {
                        print("Email is :${_loginEmail} ");
                        print("Pass is :${_LoginPass} ");
                        setState(() {
                          SubmitForm();
                        });
                      },
                      outlinebtn: true,
                      IsLoading: ISloading, // this makes the loading animation
                      //this colors the button
                    ),

                  ],
                ),
              ),
              //function Call --------Down----------
              Padding(
                padding: EdgeInsets.all(5),
                child: custombtn(
                  textt: "Create New Account",
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  outlinebtn: false,
                  IsLoading: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
