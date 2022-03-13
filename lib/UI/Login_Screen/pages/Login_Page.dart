import 'dart:convert';
import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/TermsOfService/Pages/Terms.dart';
import 'package:commerce_app/UI/Widgets/Buttom_Taps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Widgets/Custom_btn.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:commerce_app/UI/Login_Screen/pages/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isSigningIn = false;

  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  var _formkey2 = GlobalKey<FormState>(); //password
  var _formkey3 = GlobalKey<FormState>(); //email
   GoogleSignIn googleSignIn;
  var auth = FirebaseAuth.instance.currentUser;
  bool SecureInput_pass = false;
  bool ISloading = false;
  String _loginEmail = " ";
  String _LoginPass = " ";
  String LoginAccountFeedBack;
  FocusNode _PasswordFocusNode;
   Future<User> signInWithGoogle({ BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
        await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      googleSignIn = GoogleSignIn();

      GoogleSignInAccount googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
          await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
          } else if (e.code == 'invalid-credential') {
            // ...
          }
        } catch (e) {
          // ...
        }
      }
    }

    return user;
  }
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
  Future<String> _SignInAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _EmailController.text,
          password: _PassController.text); //this code signs in. to your database
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
    try {
      //Sets the button to loading state...
      setState(() {
        ISloading = true;
      });
      LoginAccountFeedBack = await _SignInAccount();
      // calls the SignIn function
      // if the String not Null we have an error , so we call _alreatDialog and pass the error as a perameter.
      if (LoginAccountFeedBack != null) {
        _alreatDialogBuilder(LoginAccountFeedBack.toString(), "error");
        setState(() {
          ISloading = false;
        });
      } else {
        setState(() {
          ISloading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Buttom_tabs()),
        );
        // i set the email and pass to empty after using it So i dont get some Exceptions
        _loginEmail = " ";
        _LoginPass = " ";
        print("done");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Signed In Successfully ',
            style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w500),
          )),
        );
      }
    } catch (e) {
      _alreatDialogBuilder("Something Went Wrong. try again", "error");
    }
    // THE RETURN TYPE IS null so user is "Good" and head our way to the homepage.
  }

  @override
  void initState() {
    super.initState();
    _PasswordFocusNode = FocusNode();
    _EmailController.addListener(() {setState(() {});});// this makes the textfeild watching what are you typing

    _EmailController.text = UserSimplePreferences.GetEmail();
    _PassController.text = UserSimplePreferences.Getpass();
    // googleSignIn=  googleSignIn.currentUser!=null ? googleSignIn.currentUser as GoogleSignIn:null;
    // _PassController.text = "LOL";
    _PassController.addListener(() async{
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    //we use dispose method to prevent memmory leaks
    _PasswordFocusNode.dispose();
    _EmailController.dispose();
    _PassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Stack(children: [
        Container(
          width: w,
          height: h,
          decoration: BoxDecoration(color: constants.blackBack),
        ),
        SafeArea(
          child: Container(
            //this section makes the page responsive.
            width: w,
            height: h,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                child: Column(children: [
                  Image.asset(
                    "Assets/Images/LOGO121.png",
                    width: w / 1.5,
                    height: h / 5,
                  ),
                  Container(
                    child: Center(
                      //\n Login to Your Account
                      child: Text(
                        " Welcome Back!",
                        style: TextStyle(color: constants.white, fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      //\n Login to Your Account
                      child: Text(
                        " Login to Continue to Radio App",
                        style: TextStyle(
                            color: constants.writingONback, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: w / 1.1,
                          height: h / 10,
                          child: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                            //auto validation turns on with click or something
                            key: _formkey3,
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
                                _PasswordFocusNode.requestFocus();
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
                          )),
                      Container(
                          width: w / 1.1,
                          height: h / 10,
                          child: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                            //auto validation turns on with click or something
                            key: _formkey2,
                            //key depends on which textfield which 2 textfield using this code.
                            child: TextFormField(
                              style: TextStyle(color: Colors.white70),
                              // textInputAction: TextInputAction.next,
                              controller: _PassController,
                              onChanged: (value) {
                                _LoginPass = value;
                              },
                              onFieldSubmitted: (value) {
                                _LoginPass = value;
                                SubmitForm();
                              },
                              focusNode: _PasswordFocusNode,
                              validator: MultiValidator([
                                // the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
                                RequiredValidator(errorText: "Required"),
                                MinLengthValidator(6,
                                    errorText:
                                        "Password must be Above 6 Characters"),
                              ]),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: constants.textfieldBack,
                                  prefixIcon: Icon(Icons.lock),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 12),
                                  hintText: "password..",
                                  labelText: "Password",
                                  // we access constructor in statefulWidgets Throw Widget.Var
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue[900],
                                  ),
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    //if secureinput which is passed in argument true i need the secure Icon if not DONT NEED IT
                                    icon: Icon((SecureInput_pass
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.security)),
                                    // : (SecureInput_pass ? Icons.remove_red_eye_outlined: Icons.security)),
                                    onPressed: () {
                                      setState(() {
                                        // _EmailController.clear();
                                        SecureInput_pass = !SecureInput_pass;
                                      });
                                    },
                                  )),
                              keyboardType: TextInputType.text,
                              obscureText: SecureInput_pass,
                            ),
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Text(
                              "    TRUE MARK ",
                              style: TextStyle(color: constants.writingONback),
                            )),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/ChangePass");
                              },
                              child: Container(
                                  child: Text(
                                "Forgot password?     ",
                                style:
                                    TextStyle(color: constants.writingONback),
                              )),
                            ),
                          ]),
                    ]),
              ),
              Container(
                height: h / 2.3,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: custombtn(
                        WantBig: true,
                        WantImage: false,
                        IsGoogle: false,
                        btnColor: constants.pinkColor,
                        outlineColor: Colors.black45,
                        TxtColor: constants.white,
                        textt: "Log In",
                        //this text of the button passed to the custombtn function
                        onPressed: () async{
                          print("Email is :${_loginEmail} ");
                          print("Pass is :${_LoginPass} ");
                          await UserSimplePreferences.SetEmail(_EmailController.text);
                          await  UserSimplePreferences.SetPass(_PassController.text);

                          setState(
                            () {
                              if (_formkey2.currentState.validate() &&
                                  _formkey3.currentState.validate()) {
                                SubmitForm();

                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                // ScaffoldMessenger.of(context).showSnackBar(
                                // const SnackBar(content: Text('Processing Data')),
                                // );
                              } else if (_EmailController.text.isEmpty &&
                                  _PassController.text.isEmpty) {
                                _loginEmail = "";
                                _LoginPass = "";
                                _alreatDialogBuilder(
                                    "Email and password Mustn't be Empty",
                                    "Error");
                              } else if (!RegExp(constants.emailvalidaition.toString())
                                  .hasMatch(_EmailController.text)) {
                                _alreatDialogBuilder(
                                    "Thats not an Email", "Error");
                              } else if (_EmailController.text.isEmpty) {
                                _loginEmail = "";
                                _alreatDialogBuilder(
                                    "Email must be Above 6 Characters ",
                                    "Error");
                              } else if (_PassController.text.isEmpty) {
                                _LoginPass = "";
                                _alreatDialogBuilder(
                                    "password Mustn't be Empty", "Error");
                              } else if (_PassController.text.length < 6) {
                                _alreatDialogBuilder(
                                    "password Must be  Atleast 6 Characters",
                                    "Error");
                              }
                              print(_loginEmail);
                            },
                          );
                        },

                        // outlinebtn: true,Forgot your password? Change password"
                        IsLoading:
                            ISloading, // this makes the loading animation
                        //this colors the button
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: w / 2.5,
                          height: h / 500,
                          color: Colors.white12,
                        ),
                        Container(
                          child: Text(
                            "OR",
                            style: TextStyle(
                                color: constants.writingONback,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          width: w / 2.5,
                          height: h / 500,
                          color: Colors.white12,
                        ),
                      ],
                    ),
                    Container(
                      child: custombtn(
                        WantBig: false,
                        WantImage: true,
                        IsGoogle: true,
                        btnColor: constants.white,
                        outlineColor: Colors.black45,
                        TxtColor: Colors.black45,
                        textt: "Continue With Google",
                        //this text of the button passed to the custombtn function
                        onPressed: () async {
                          setState(() {
                            _isSigningIn = true;
                          });

                          User user =
                          await signInWithGoogle(context: context);

                          setState(() {
                            _isSigningIn = false;
                          });

                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Buttom_tabs(),
                              ),
                            );
                          }
                        },

                        // outlinebtn: true,Forgot your password? Change password"
                        IsLoading:
                            ISloading, // this makes the loading animation
                        //this colors the button
                      ),
                    ),
                    Container(
                      child: custombtn(
                        WantBig: false,
                        WantImage: true,
                        IsGoogle: false,
                        btnColor: constants.blueF,
                        outlineColor: Colors.black45,
                        TxtColor: constants.white,
                        textt: "Continue With Facebook",
                        //this text of the button passed to the custombtn function
                        onPressed: () {},

                        IsLoading: ISloading,
                        // this makes the loading animation
                        //this colors the button
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/register");
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Don't Have an account?",
                                          style: TextStyle(
                                            color: constants.writingONback,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Sign Up",
                                          style: TextStyle(
                                            color: constants.pinkOnBack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Terms()));
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      /*
                                                  By signing up you indicate that you have read and
agreed to the Patch Terms of Service
                                                   */
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              " By signing up you indicate that you have read and\n agreed to the Patch ",
                                          style: TextStyle(
                                            color: constants.writingONback,
                                            fontSize: 10,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Terms of Service",
                                          style: TextStyle(
                                            color: constants.pinkOnBack,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),

                    //SizedBox(height: 1,)
                  ],
                ),
              ),
            ]),
          ),
        ),
      ])),
    ));
  }
}
//   Container(
//                 height: 570,
//                   child: GridView.builder(
//                       shrinkWrap: true,
//                       itemCount: 20,
//                       gridDelegate:
//                       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                       itemBuilder: (context, index) {
//                         return  Container(
//                           width: (MediaQuery.of(context).size.width / 2.4),
//                           height: (MediaQuery.of(context).size.width / 2.4),
//                           child: Card(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SvgPicture.asset (
//                                   'assets/images/car_ins_btn.svg',
//
//                                   height: 80,
//                                   width: 80,
//                                 ),
//                                 SizedBox(height: 15,),
//                                 Container(
//                                   child: Text('Motor Insurco'),
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//
//
//                         // return _tile(data[index].name, data[index].name, Icons.work);
//                       })
//
//               ),
/*
   // Container(
                   //   child: custombtn(
                   //        textt: "Create New Account",
                   //        onPressed: () {
                   //          Navigator.pushNamed(context, "/register");
                   //        },
                   //       // outlinebtn: false,
                   //        IsLoading: false,
                   //     btnColor: constants.blueF,
                   //     outlineColor: Colors.black45,
                   //     TxtColor: constants.white,
                   //
                   //      ),
                   // ),
                            // textfeild(
                        //   Onsubmitted: (value) {
                        //     // when click on submit btn pass info
                        //     _loginEmail = value;
                        //      _PasswordFocusNode.requestFocus();
                        //   },
                        //   Text2: "Email",
                        //   isEMAIL: true,
                        //   Onchanged: (value) {
                        //     _loginEmail = value;
                        //   },
                        //   TextInputaction: TextInputAction.next,
                        // ),
                        // textfeild(
                        //   Text2: "Password",
                        //   isEMAIL: false,
                        //   Onsubmitted: (value) {  SubmitForm(); },
                        //     // when click on submit btn pass info
                        //
                        //
                        //   Onchanged: (value) {_LoginPass = value;  },
                        //
                        //
                        //    FoucesNode: _PasswordFocusNode,
                        // ),

                              // else if(_loginEmail.isEmpty && _LoginPass.isEmpty){
                              //   _alreatDialogBuilder("Email and password Mustn't be Empty","Error");
                              // }else if (_LoginPass.length < 6  ){
                              //   _alreatDialogBuilder("Password must be Above 6 Characters ","Error");
                              // }else if (_loginEmail.isEmpty){
                              //   _alreatDialogBuilder("Email Mustn't be Empty","Error");
                              // }else if (_LoginPass.isEmpty){
                              //   _alreatDialogBuilder("password Mustn't be Empty","Error");
                              // }else if (!RegExp(emailvalidaition).hasMatch(_loginEmail)){
                              //   _alreatDialogBuilder("Thats not an Email","Error");
                              // }else {
                              //   print("user at login screen : $auth");
                              //   SubmitForm();
                              // }
 */
