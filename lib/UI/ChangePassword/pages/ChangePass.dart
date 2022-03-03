import 'package:commerce_app/UI/Widgets/AppBar.dart';
import 'package:commerce_app/UI/Widgets/Custom_Textfield.dart';
import 'package:commerce_app/UI/Widgets/Custom_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ChangePass extends StatefulWidget {
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController _EmailController = TextEditingController();
  var _formkey2 = GlobalKey<FormState>(); //
  bool _ISLoading = false;
  String _loginEmail = " ";
  User user;

  Future<void> _alreatDialogBuilder(String body, String title) async {
    return showDialog(
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              child: Text(body),
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
        },
        context: context);
  }
  Future<String> ChangingPass() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _loginEmail);
      return null;
    } catch (e) {
      switch (e.code) {
        case "user-not-found":
          return e.toString();
          break;
      }
    }
  }
  void SubmitForm() async {
    //Sets the button to loading state...
    setState(() {
      _ISLoading = true;
    });
    String ChangePassFeedback = await ChangingPass() as String;
    // if the String not Null we have an error , so we call _alreatDialog and pass the error as a perameter.
    if (ChangePassFeedback != null) {
      setState(() {
        _ISLoading = false;
      });
      _alreatDialogBuilder(ChangePassFeedback.toString(), "Error");
    } else {
      _alreatDialogBuilder("Sent Password Recovery Email ", "Change Password");
      // print("done");
      setState(() {
        _ISLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return SafeArea(
        child: Scaffold(
          body: Stack(children: [
            Container(
              width: w,
              height: h,
              decoration: BoxDecoration(color: constants.blackBack),
            ),
            SafeArea(
              child: Container(
                //  color: Colors.yellow,
                width: w,
                height: h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h / 5,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.s,
                        children: [
                          Text(""),
                          Container(
                            child: Center(
                              //\n Login to Your Account
                              child: Text(
                                " Forgot Password!",
                                style: TextStyle(
                                    color: constants.white, fontSize: 23),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                """ Enter your email address below. 
 We'll look for your account 
    and send you a password reset email. """,
                                style: TextStyle(
                                    color: constants.writingONback,
                                    fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ), //
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: w/1.1,
                              height: h/11,
                              child: Form(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                                //auto validation turns on with click or something
                                key: _formkey2,
                                //key depends on which textfield which 2 textfield using this code.
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: _EmailController,
                                  onChanged: (value) {
                                    _loginEmail = value;
                                    _loginEmail.toLowerCase();
                                  },

                                  onFieldSubmitted: (value) {
                                    _loginEmail = value;
                                   // _PasswordFocusNode.requestFocus();
                                  },
                                  //  focusNode:FoucesNodeEmail,

                                  validator: MultiValidator([
                                    // the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
                                    RequiredValidator(errorText: "Required"),
                                    EmailValidator(errorText: "That's not an Email")
                                    // MinLengthValidator(2, errorText: "Password must be Above 2 Characters")),
                                    //  MinLengthValidator(6,  errorText: "Password must be Above 6 Characters"),
                                  ]),
                                  cursorColor: Colors.black,
                                  style: TextStyle(color: Colors.white70),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: constants.textfieldBack,
                                      prefixIcon: Icon(Icons.email),
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 12),
                                      hintText: "Email..",
                                      labelText: "Email Address",
                                      // we access constructor in statefulWidgets Throw Widget.Var
                                      labelStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue[900],
                                      ),
                                      border: OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                        //if secureinput which is passed in argument true i need the secure Icon if not DONT NEED IT
                                        icon: Icon(_EmailController.text.isEmpty
                                            ? null
                                            : Icons.close),
                                        // : (SecureInput_pass ? Icons.remove_red_eye_outlined: Icons.security)),
                                        onPressed: () {
                                          setState(() {
                                            _EmailController.clear();
                                          });
                                        },
                                      )),
                                  keyboardType: TextInputType.text,
                                  //  obscureText: SecureInput_pass,
                                ),
                              ),
                              // child: textfeild(
                              //   OnIconPressed: () {
                              //     _loginEmail = "";
                              //   },
                              //   Onsubmitted: (value) {
                              //     // when click on submit btn pass info
                              //     value.toLowerCase();
                              //     _loginEmail = value;
                              //
                              //     // _PasswordFocusNode.requestFocus();
                              //   },
                              //   Text2: "Email",
                              //   isEMAIL: true,
                              //   Onchanged: (value) {
                              //     value.toLowerCase();
                              //     _loginEmail = value;
                              //   },
                              //   //TextInputaction: TextInputAction.next,
                              // ),
                            ),
                            Container(
                              child: custombtn(
                                WantBig: true,
                                WantImage: false,
                                IsGoogle: false,
                                textt: " Send Password Reset",
                                //this text of the button passed to the custombtn function
                                onPressed: () {
                                  if (_loginEmail.isEmpty) {
                                    _alreatDialogBuilder(
                                        "Email Can't Be Empty", "Error");
                                  } else if (!RegExp(
                                          constants.emailvalidaition.toString())
                                      .hasMatch(_loginEmail.toLowerCase())) {
                                    _alreatDialogBuilder(
                                        "Thats not an Email", "Error");
                                  } else {
                                    SubmitForm();
                                  }
                                },

                                IsLoading: _ISLoading,
                                // this makes the loading animation
                                btnColor: constants.LightPink,
                                TxtColor: constants.white,
                                outlineColor: constants.blackBack,
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Text(
                                        "Already Have an account?",
                                        style: TextStyle(
                                            color: constants.writingONback),
                                      )),
                                      Container(
                                          child: Text(
                                        "Sign IN",
                                        style: TextStyle(
                                            color: constants.pinkOnBack),
                                      )),
                                    ]),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),

                //SizedBox(height: 1,)
              ),
            ),
          ]),
        ),
      );
    });
  }
}
