import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/VerfiyScreen/Pages/VerfiyScreen.dart';
import 'package:commerce_app/UI/Widgets/Buttom_Taps.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Widgets/Custom_Textfield.dart';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Widgets/Custom_btn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();

//default Form Loading State for the Sign Up BUTTON for animation
}

class _SignUpState extends State<SignUp> {
  bool _ISLoading = false;
  FocusNode FoucesNodePass; //fouces on curser where is it at right now
  FocusNode FoucesNodeEmail;

  //FocusNode FoucesNodeEmail; //fouces on curser where is it at right now
  var _formkey1 = GlobalKey<FormState>();
  var _formkey2 = GlobalKey<FormState>(); //password textfeild key
  var _formkey3 = GlobalKey<FormState>(); //email textfield key
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  TextEditingController _UsernameController = TextEditingController();
  bool SecureInput_pass = false;

  // this controls the hide and show password characters

  String _RegisterEmail = " ";
  String _RegisterPass = " ";
  String name = " ";

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
      } else if (e.code == " Given-String-is-empty-or-null") {
        return "Email and password Shouldn't be empty";
      } else
        return "error :  $e ";
    } catch (e) {
      return " exception : $e";
    }
  }

  // void updateUserInfo() {
  //   var user = FirebaseAuth.instance.currentUser;
  //   user.updateProfile(displayName: "Abel", photoURL: "photoPath").then((value){
  //     print("Profile has been changed successfully");
  //     //DO Other compilation here if you want to like setting the state of the app
  //   }).catchError((e){
  //     print("There was an error updating profile");
  //   });
  // }

  void SubmitForm() async {
    //Sets the button to loading state...
    setState(() {
      _ISLoading = true;
    });

    String CreateAccountFeedBack =
        await _CreateAccount(); // calls the createaccount function
    // if the String not Null we have an error , so we call _alreatDialog and pass the error as a perameter.
    if (CreateAccountFeedBack != null) {
      setState(() {
        _ISLoading = false;
      });
      _alreatDialogBuilder(CreateAccountFeedBack.toString(), "Error");
    } else {
      User user = FirebaseAuth.instance.currentUser;
      user.updateDisplayName(name);
      //if no errors with signupfeedback  do the following
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Buttom_tabs()),
      );
      // i
      setState(() {
        _ISLoading = false;
      });
      print("done");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'you can\'t sign in If not verfied ',
        style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w500),
      )));
    }

    setState(() {
      _ISLoading = false;
    });
  }//[0-9 ]+

  void initState() {
    _EmailController.addListener(() {
      setState(() {});
    }); // this makes the textfeild watching what are you typing

    _PassController.addListener(() {
      setState(() {});
    });
    FoucesNodePass = FocusNode();
    FoucesNodeEmail = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    FoucesNodePass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Stack(children: [
              Container(
                width: w,
                height: h,
                decoration: BoxDecoration(color: constants.blackBack),
              ),
              SafeArea(
                child: Container(
                  //this section makes the page responsive.Because it Contains all the Page
                  width: w,
                  height: h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: h / 6.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset("Assets/Images/LOGO121.png",width: w/1.5,height: h/5,),
                            Text(""),
                            Container(
                              child: Center(
                                //\n Login to Your Account
                                child: Text(
                                  " Sign UP!",
                                  style: TextStyle(
                                      color: constants.white, fontSize: 23),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                //\n Login to Your Account
                                child: Text(
                                  " Sign up and Start ",
                                  style: TextStyle(
                                      color: constants.writingONback,
                                      fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), // OPEN UP WRITING
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: w / 1.1,
                                  height: h / 10,
                                  child: Form(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,

                                    //auto validation turns on with click or something
                                    key: _formkey1,
                                    //key depends on which textfield which 2 textfield using this code.
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white70),
                                      // textInputAction: TextInputAction.next,
                                      controller: _UsernameController,
                                      onChanged: (value) {
                                        name = value;
                                      },
                                      onFieldSubmitted: (value) {
                                        name = value;
                                        FoucesNodeEmail.requestFocus();
                                        // SubmitForm();
                                      },
                                      // focusNode: FoucesNodePass,
                                      validator: MultiValidator([

                                        // the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
                                        RequiredValidator(errorText: "Required"),
                                        MinLengthValidator(4,
                                            errorText:
                                                "name must be Above 4 Characters"),

                                      ]),
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: constants.textfieldBack,
                                          prefixIcon: Icon(Icons.person),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          hintText: "User Name",
                                          labelText: "User Name",
                                          // we access constructor in statefulWidgets Throw Widget.Var
                                          labelStyle: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue[900],
                                          ),
                                          border: OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                            //if secureinput which is passed in argument true i need the secure Icon if not DONT NEED IT
                                            icon: Icon(
                                                _EmailController.text.isEmpty
                                                    ? null
                                                    : Icons.close),
                                            onPressed: () {
                                              setState(() {
                                                _UsernameController.clear();
                                              });
                                            },
                                          )),
                                      keyboardType: TextInputType.text,
                                     // obscureText: SecureInput_pass,
                                    ),
                                  )),
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
                                        _RegisterEmail = value;
                                        _RegisterEmail.toLowerCase();
                                      },
                                      onFieldSubmitted: (value) {
                                        _RegisterEmail = value;
                                        FoucesNodePass.requestFocus();
                                      },
                                      focusNode: FoucesNodeEmail,
                                      validator: MultiValidator([
                                        // the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
                                        RequiredValidator(errorText: "Required"),
                                        EmailValidator(
                                            errorText: "That's not an Email")
                                        // MinLengthValidator(2, errorText: "Password must be Above 2 Characters")),
                                        //  MinLengthValidator(6,  errorText: "Password must be Above 6 Characters"),
                                      ]),
                                      cursorColor: Colors.black,
                                      style: TextStyle(color: Colors.white70),
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: constants.textfieldBack,
                                          prefixIcon: Icon(Icons.email),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12),
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
                                            icon: Icon(
                                                _EmailController.text.isEmpty
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
                                        _RegisterPass = value;
                                      },
                                      onFieldSubmitted: (value) {
                                        _RegisterPass = value;
                                        SubmitForm();
                                      },
                                      focusNode: FoucesNodePass,
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
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12),
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
                                                SecureInput_pass =
                                                    !SecureInput_pass;
                                              });
                                            },
                                          )),
                                      keyboardType: TextInputType.text,
                                      obscureText: SecureInput_pass,
                                    ),
                                  )),
                            ]),
                      ), // textforms--------------------------------
                      Container(
                       // color: Colors.blue,
                        height: h / 2.1,
                        padding: EdgeInsets.only(top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: custombtn(
                                WantBig: true,
                                WantImage: false,
                                IsGoogle: false,
                                btnColor: constants.pinkColor,
                                outlineColor: Colors.black45,
                                TxtColor: constants.white,
                                textt: "Sign Up",
                                //this text of the button passed to the custombtn function
                                onPressed: () {
                                  print("Email is :${_RegisterEmail} ");
                                  print("Pass is :${_RegisterPass} ");
                                  setState(
                                    () {
                                      if (_formkey2.currentState.validate() &&
                                          _formkey3.currentState.validate() &&  _formkey1.currentState.validate()) {
                                        SubmitForm();

                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        // ScaffoldMessenger.of(context).showSnackBar(
                                        // const SnackBar(content: Text('Processing Data')),
                                        // );
                                      } else if (_EmailController.text.isEmpty &&
                                          _PassController.text.isEmpty && _UsernameController.text.isEmpty) {
                                        _RegisterEmail = "";
                                        _RegisterPass = "";
                                        name = "";
                                        _alreatDialogBuilder(
                                            "Fields Mustn't be Empty",
                                            "Error");
                                      } else if (constants.LetterAndNumbers
                                          .hasMatch(_UsernameController.text)) {
                                        _alreatDialogBuilder(
                                            "That is not a correct Name", "Error");
                                      }else if (!RegExp(
                                              constants.emailvalidaition.toString())
                                          .hasMatch(_PassController.text)) {
                                        _alreatDialogBuilder(
                                            "Thats not an Email", "Error");
                                      } else if (_EmailController.text.isEmpty) {
                                        _RegisterEmail = "";
                                        _alreatDialogBuilder(
                                            "Email must be Above 6 Characters ",
                                            "Error");
                                      } else if (_PassController.text.isEmpty) {
                                        _RegisterPass = "";
                                        _alreatDialogBuilder(
                                            "password Mustn't be Empty", "Error");
                                      } else if (_PassController.text.length <
                                          6) {
                                        _alreatDialogBuilder(
                                            "password Must be  Atleast 6 Characters",
                                            "Error");
                                      }
                                      print(_RegisterPass);
                                    },
                                  );
                                },

                                // outlinebtn: true,Forgot your password? Change password"
                                IsLoading:
                                    _ISLoading, // this makes the loading animation
                                //this colors the button
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Container(
                                width: w/2.5,
                                height: h/500,

                                color: Colors.white12,),
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
                                width: w/2.5,
                                height: h/500,

                                color: Colors.white12,),
                            ],),

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
                                onPressed: () {},

                                // outlinebtn: true,Forgot your password? Change password"
                                IsLoading:
                                    _ISLoading, // this makes the loading animation
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

                                // outlinebtn: true,Forgot your password? Change password"
                                IsLoading:
                                    _ISLoading, // this makes the loading animation
                                //this colors the button
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/login");
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children:  <TextSpan>[
                                                TextSpan(text: "Already Have an account?", style: TextStyle(
                                                  color: constants.writingONback,),
                                                ),TextSpan(text: "Sign IN", style: TextStyle(
                                                  color: constants.pinkOnBack,),
                                                ),

                                              ],
                                            ),
                                          )

                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ), //btns--------------------
                      ), //  btns
                    ],
                  ),
                ),
              ),
            ]),
        ),
        ),

    );
  }
// Widget build(BuildContext context) {
//
// print("Email is :${_loginEmail} ");
// print("Pass is :${_LoginPass} ");
// setState(() {
//   if (_formkey2.currentState.validate() && _formkey3.currentState.validate() ) {
//     SubmitForm();
//
//     // If the form is valid, display a snackbar. In the real world,
//     // you'd often call a server or save the information in a database.
//     // ScaffoldMessenger.of(context).showSnackBar(
//     // const SnackBar(content: Text('Processing Data')),
//     // );
//   }
//   else if (_EmailController.text.isEmpty && _PassController.text.isEmpty) {
//     _loginEmail="";
//     _LoginPass="";
//     _alreatDialogBuilder(
//         "Email and password Mustn't be Empty", "Error");
//   }else if
//   (!RegExp(emailvalidaition.toString()).hasMatch(
//       _PassController.text)) {
//     _alreatDialogBuilder("Thats not an Email", "Error");
//   } else if (_EmailController.text.isEmpty) {
//     _loginEmail="";
//     _alreatDialogBuilder(
//         "Email must be Above 6 Characters ",
//         "Error");
//   } else if (_PassController.text.isEmpty) {
//     _LoginPass="";
//     _alreatDialogBuilder(
//         "password Mustn't be Empty", "Error");
//   } else if (_PassController.text.length<6) {
//     _alreatDialogBuilder(
//         "password Must be  Atleast 6 Characters", "Error");
//   }
//   print(_loginEmail);
//
//
//
// },);
// Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children : [
//
//       Container(
//           child: Text("    TRUE MARK ",
//             style: TextStyle(color: constants.writingONback),)
//
//       ),
//       InkWell(
//         onTap: (){
//           Navigator.pushNamed(context, "/ChangePass");
//         },
//         child:Container(
//             child: Text("Forgot password?     ",
//               style: TextStyle(color: constants.writingONback),)
//
//         ),),
//
//
//     ]
// ),

//   var height = MediaQuery.of(context).size.height;
//   var width = MediaQuery.of(context).size.width;//Dont use more than that.
//
//   return SafeArea(
//     child: Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: width,
//           height: height,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(height: 6,),
//
//               Container(
//                 child: Center(
//                   child: Text(
//                     "  Make A new Account ",
//                     style: constants.boldheadding,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Container(
//                 child: Column(
//                   children: [
//                     Column(children: [
//                       Container(
//                           width: width/1.1,
//                           height: height/9.5,
//                           child: Form(
//                             autovalidateMode: AutovalidateMode.onUserInteraction,
//                             //auto validation turns on with click or something
//                             key: _formkey3,
//                             //key depends on which textfield which 2 textfield using this code.
//                             child: TextFormField(
//                               style: TextStyle(color: Colors.white70),
//                               textInputAction: TextInputAction.next,
//                               controller: _EmailController,
//                               onChanged: (value) {
//                                 _RegisterEmail = value;
//                                 _RegisterEmail.toLowerCase();
//                               },
//
//                               onFieldSubmitted: (value) {
//                                 _RegisterEmail = value;
//                                 FoucesNodePass.requestFocus();
//                               },
//                               //  focusNode:FoucesNodeEmail,
//
//                               validator: MultiValidator([
//                                 // the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
//                                 RequiredValidator(errorText: "Required"),
//                                 EmailValidator(errorText: "That's not an Email")
//                                 // MinLengthValidator(2, errorText: "Password must be Above 2 Characters")),
//                                 //  MinLengthValidator(6,  errorText: "Password must be Above 6 Characters"),
//                               ]),
//                               cursorColor: Colors.black,
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(
//                                   Icons.email
//                                 ),
//                                   contentPadding:
//                                       EdgeInsets.symmetric(horizontal: 12),
//                                   hintText: "Email..",
//                                   labelText: "Email",
//                                   // we access constructor in statefulWidgets Throw Widget.Var
//                                   labelStyle: TextStyle(
//                                     fontSize: 18,
//                                     color: Colors.blue[900],
//                                   ),
//                                   border: OutlineInputBorder(),
//                                   suffixIcon: IconButton(
//                                     //if secureinput which is passed in argument true i need the secure Icon if not DONT NEED IT
//                                     icon: Icon(_EmailController.text.isEmpty
//                                         ? null
//                                         : Icons.close),
//                                     // : (SecureInput_pass ? Icons.remove_red_eye_outlined: Icons.security)),
//                                     onPressed: () {
//                                       setState(() {
//                                         _EmailController.clear();
//                                       });
//                                     },
//                                   )),
//                               keyboardType: TextInputType.text,
//                               obscureText: SecureInput_pass,
//                             ),
//                           )),
//                       Container(
//                           width: width / 1.1,
//                           height: height / 9.5,
//                           child: Form(
//                             autovalidateMode:
//                                 AutovalidateMode.onUserInteraction,
//
//                             //auto validation turns on with click or something
//                             key: _formkey2,
//                             //key depends on which textfield which 2 textfield using this code.
//                             child: TextFormField(
//                               style: TextStyle(color: Colors.white70),
//                               // textInputAction: TextInputAction.next,
//                               controller: _PassController,
//                               onChanged: (value) {
//                                 _RegisterPass = value;
//                               },
//                               onFieldSubmitted: (value) {
//                                 _RegisterPass = value;
//                                 SubmitForm();
//                               },
//                               focusNode: FoucesNodePass,
//                               validator: MultiValidator([
//                                 // the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
//                                 RequiredValidator(errorText: "Required"),
//                                 MinLengthValidator(6,
//                                     errorText:
//                                         "Password must be Above 6 Characters"),
//                               ]),
//                               cursorColor: Colors.black,
//                               decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: constants.textfieldBack,
//                                   prefixIcon: Icon(Icons.lock),
//                                   contentPadding:
//                                       EdgeInsets.symmetric(horizontal: 12),
//                                   hintText: "password..",
//                                   labelText: "Password",
//                                   // we access constructor in statefulWidgets Throw Widget.Var
//                                   labelStyle: TextStyle(
//                                     fontSize: 18,
//                                     color: Colors.blue[900],
//                                   ),
//                                   border: OutlineInputBorder(),
//                                   suffixIcon: IconButton(
//                                     //if secureinput which is passed in argument true i need the secure Icon if not DONT NEED IT
//                                     icon: Icon((SecureInput_pass
//                                         ? Icons.remove_red_eye_outlined
//                                         : Icons.security)),
//                                     // : (SecureInput_pass ? Icons.remove_red_eye_outlined: Icons.security)),
//                                     onPressed: () {
//                                       setState(() {
//                                         // _EmailController.clear();
//                                         SecureInput_pass = !SecureInput_pass;
//                                       });
//                                     },
//                                   )),
//                               keyboardType: TextInputType.text,
//                               obscureText: SecureInput_pass,
//                             ),
//                           )),
//                     ]),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       child: custombtn(
//                         btnColor: constants.blueF,
//                         outlineColor: Colors.black45,
//                         TxtColor: constants.pinkColor,
//                         textt: "Sign Up",
//                         //this text of the button passed to the custombtn function
//                         onPressed: () {
//                           setState(() {
//                             if (_formkey2.currentState.validate() &&
//                                 _formkey3.currentState.validate()) {
//                               SubmitForm();
//                             } else if (_EmailController.text.isEmpty &&
//                                 _PassController.text.isEmpty) {
//                               _RegisterEmail = "";
//                               _RegisterPass = "";
//                               _alreatDialogBuilder(
//                                   "Email and password Mustn't be Empty", "Error");
//                             } else if (!RegExp(emailvalidaition.toString())
//                                 .hasMatch(_PassController.text)) {
//                               _alreatDialogBuilder("Thats not an Email", "Error");
//                             } else if (_EmailController.text.isEmpty) {
//                               _RegisterEmail = "";
//                               _alreatDialogBuilder(
//                                   "Eamil Can't be Empty ", "Error");
//                             } else if (_PassController.text.isEmpty) {
//                               _RegisterPass = "";
//                               _alreatDialogBuilder(
//                                   "password Mustn't be Empty", "Error");
//                             } else if (_PassController.text.length < 6) {
//                               _alreatDialogBuilder(
//                                   "password Must be  Atleast 6 Characters",
//                                   "Error");
//                             }
//                             print(_RegisterEmail);
//                             print(_RegisterPass);
//                           });
//                         },
//                       //  outlinebtn: true,
//                         IsLoading: widget._ISLoading, //this colors the button
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Spacer(),
//               Container(
//                 child: custombtn(
//                   btnColor: constants.blueF,
//                   outlineColor: Colors.black45,
//                   TxtColor: constants.pinkColor,
//                   textt: "Back to Login Page",
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                  // outlinebtn: false,
//                   IsLoading: false,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
}
/*
   //
                                // print("Email is :${_loginEmail} ");
                                // print("Pass is :${_LoginPass} ");
                                // setState(() {
                                //   if (_formkey2.currentState.validate() && _formkey3.currentState.validate() ) {
                                //     SubmitForm();
                                //
                                //     // If the form is valid, display a snackbar. In the real world,
                                //     // you'd often call a server or save the information in a database.
                                //     // ScaffoldMessenger.of(context).showSnackBar(
                                //     // const SnackBar(content: Text('Processing Data')),
                                //     // );
                                //   }
                                //   else if (_EmailController.text.isEmpty && _PassController.text.isEmpty) {
                                //     _loginEmail="";
                                //     _LoginPass="";
                                //     _alreatDialogBuilder(
                                //         "Email and password Mustn't be Empty", "Error");
                                //   }else if
                                //   (!RegExp(emailvalidaition.toString()).hasMatch(
                                //       _PassController.text)) {
                                //     _alreatDialogBuilder("Thats not an Email", "Error");
                                //   } else if (_EmailController.text.isEmpty) {
                                //     _loginEmail="";
                                //     _alreatDialogBuilder(
                                //         "Email must be Above 6 Characters ",
                                //         "Error");
                                //   } else if (_PassController.text.isEmpty) {
                                //     _LoginPass="";
                                //     _alreatDialogBuilder(
                                //         "password Mustn't be Empty", "Error");
                                //   } else if (_PassController.text.length<6) {
                                //     _alreatDialogBuilder(
                                //         "password Must be  Atleast 6 Characters", "Error");
                                //   }
                                //   print(_loginEmail);
                                //
                                //
                                //
                                // },);
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            // ScaffoldMessenger.of(context).showSnackBar(
                            // const SnackBar(content: Text('Processing Data')),
                            // );

                    // textfeild(
                    //   Text2: "Email",
                    //   isEMAIL: true,
                    //   Onchanged: (value) {
                    //     _RegisterEmail = value;
                    //   },
                    //   TextInputaction: TextInputAction.next,
                    // ),
                    // textfeild(
                    //   Text2: "Password",
                    //   isEMAIL: false,
                    //   Onchanged: (value) {
                    //     _RegisterPass = value;
                    //   },
                    //   Onsubmitted: (value){
                    //     SubmitForm();
                    //   },
                    // ),
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Field Focus',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // The first text field is focused on as soon as the app starts.
            const TextField(
              autofocus: true,
            ),
            // The second text field is focused on when a user taps the
            // FloatingActionButton.
            TextField(
              focusNode: myFocusNode,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the button is pressed,
        // give focus to the text field using myFocusNode.
        onPressed: () => myFocusNode.requestFocus(),
        tooltip: 'Focus Second Text Field',
        child: const Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
 */
