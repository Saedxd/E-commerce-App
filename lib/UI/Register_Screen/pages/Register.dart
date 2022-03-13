import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Widgets/Textfield.dart';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Widgets/Custom_btn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
  bool _ISLoading =
      false; //default Form Loading State for the Sign Up BUTTON for animation

}

class _RegisterState extends State<Register> {
  String _RegisterEmail = " ";
  String _RegisterPass = " ";

  FocusNode _PasswordFoucesNode;

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
            actions: [
              RaisedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },

              )
            ],
          );
        });
  }
  Future<String> _CreateAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _RegisterEmail, password: _RegisterPass);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else
        return "error : + $e ";
    } catch (e) {
      return " exception : $e";
    }
  }
  void SubmitForm() async {
    //Sets the button to loading state...
    setState(() { widget._ISLoading = true; });


    String CreateAccountFeedBack = await _CreateAccount();// calls the createaccount function
    // if the String not Null we have an error , so we call _alreatDialog and pass the error as a perameter.
    if (CreateAccountFeedBack != null) {
      _alreatDialogBuilder(CreateAccountFeedBack);
    }
    //Navigator.push(context,  MaterialPageRoute(builder: (context) => HomePage()), );


    print("done");
      setState(() {  widget._ISLoading = false; });

      }
  void initState() {
    _PasswordFoucesNode = FocusNode();
  }

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
                  "  Make A new Account ",
                  style: constants.boldheadding,
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                child: Column(
                  children: [
                    textfeild(
                      Text2: "Email",
                      isEMAIL: true,
                      Onchanged: (value) {
                        _RegisterEmail = value;
                      },
                      TextInputaction: TextInputAction.next,
                    ),
                    textfeild(
                      Text2: "Password",
                      isEMAIL: false,
                      Onchanged: (value) {
                        _RegisterPass = value;
                      },
                      Onsubmitted: (value){
                        SubmitForm();
                      },
                    ),
                    custombtn(
                      textt: "Sign Up",
                      //this text of the button passed to the custombtn function
                      onPressed: () {
                        setState(() {
                          SubmitForm();
                        });
                      },
                      //outlinebtn: true,
                      IsLoading: widget._ISLoading, //this colors the button
                    )
                  ],
                ),
              ),

              //function Call --------Down----------
              Padding(
                padding: EdgeInsets.all(5),
                child: custombtn(
                  textt: "Back to Login Page",
                  onPressed: () {  Navigator.pop(context);  },


                  //outlinebtn: false,
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
