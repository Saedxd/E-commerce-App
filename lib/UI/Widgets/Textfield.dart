          import 'package:flutter/material.dart';
          import 'package:auto_validate/auto_validate.dart';
          import 'package:form_field_validator/form_field_validator.dart';

          class textfeild extends StatefulWidget {

           bool isEMAIL = false;
            String Text2;
            final TextInputAction TextInputaction;// this will make the arrow in the phone keybaord
            final Function(String) Onchanged;// this function gives me the value which was written in the feild
          // and we changed i mean by changed is the curser moved to the other feild while its filed
            final Function(String) Onsubmitted;// when click on submit or sign up or login something like that
            final FocusNode FoucesNode;//fouces on curser where is it at right now

          textfeild({this.Text2,this.isEMAIL,this.FoucesNode,this.Onchanged,this.Onsubmitted,this.TextInputaction});
            @override
            _State createState() => _State();
          }
          class _State extends State<textfeild> {

            TextEditingController _EmailController = TextEditingController();
            TextEditingController _PassController = TextEditingController();
            bool SecureInput_pass = false;// this controls the hide and show password characters
            var _formkey2 = GlobalKey<FormState>();//password textfeild key
            var _formkey3 = GlobalKey<FormState>();//email textfield key
            void initState() {
              super.initState();
              _EmailController.addListener(() { setState(() {  }); });// this makes the textfeild watching what are you typing
              // and sets the state which causes a rebuild for the function which it will trigger new thing under which is the
              // icon.close Statement.
            }

            // void dispose() {
            //   _EmailController.dispose();
            //   super.dispose();
            // }
            // String ValidatorPass (String value){
            //   // Validator for TextFeilds
            //   if (value.isEmpty)
            //     return "Required";
            //   else if (value.length < 6 )
            //     return "you must enter Atleast 6 characters";
            //   else if (value.length >15)
            //     return "Max characters is 15";
            //   else
            //     return null;
            //
            // }
            @override
            Widget build(BuildContext context) {


              return Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                ),
                  child :Form(
                   key: widget.isEMAIL?_formkey3:_formkey2 ,//key depends on which textfield which 2 textfield using this code.
                  child: TextFormField(

                    textInputAction : widget.TextInputaction,
                    controller: widget.isEMAIL?_EmailController:_PassController,
                    onChanged: widget.Onchanged,
                     onFieldSubmitted: widget.Onsubmitted,
                     focusNode: widget.FoucesNode,
                     //autovalidate: true,
                    validator: MultiValidator(
                        [// the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
                          RequiredValidator(errorText: "Required"),
                          ( widget.isEMAIL?
                          EmailValidator(errorText: "That's not an Email"):MinLengthValidator(2, errorText: "Password must be Above 2 Characters")),

                          MinLengthValidator(6, errorText: "Password must be Above 6 Characters"),
                        ]
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      hintText:  widget.Text2 + "..",
                      labelText: widget.Text2,// we access constructor in statefulWidgets Throw Widget.Var
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.blue[500],
                      ),
                      border: OutlineInputBorder(),



                              suffixIcon: IconButton(
                                //if secureinput which is passed in argument true i need the secure Icon if not DONT NEED IT
                              icon: Icon(
                                widget.isEMAIL? (_EmailController.text.isEmpty? null: Icons.close):
                                (SecureInput_pass? Icons.remove_red_eye_outlined : Icons.security)),

                              onPressed: (){
                              setState(() {
                                widget.isEMAIL? _EmailController.clear() :SecureInput_pass = !SecureInput_pass;


                              });
                              },

                              )




                    ),
                    keyboardType: TextInputType.text,
                    obscureText : SecureInput_pass ,

                  ),




              ));
            }
          }

