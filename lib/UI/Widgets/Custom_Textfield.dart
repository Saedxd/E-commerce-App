import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Widgets/Custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:auto_validate/auto_validate.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:commerce_app/UI/ChangePassword/pages/ChangePass.dart';

class textfeild extends StatefulWidget {
  bool isEMAIL = true;
  bool WantSearch = false;
  String Text2;
  bool WantIcon = false;
  final Function OnIconPressed;
  final TextInputAction TextInputaction; // this will make the arrow in the phone keybaord
  final Function(String) Onchanged;  // this function gives me the value which was written in the feild
  // and we changed i mean by changed is the curser moved to the other feild while its filed
  final Function(String) Onsubmitted;
  // when click on submit or sign up or login something like that
  final FocusNode FoucesNode; //fouces on curser where is it at right now
  ChangePass instance = ChangePass();
  textfeild(
      {
        this.WantIcon,
        this.WantSearch,//want icon == want search
        this.OnIconPressed,
        this.Text2,
      this.isEMAIL,
      this.Onchanged,
      this.Onsubmitted,
      this.TextInputaction,
      this.FoucesNode,
      });

  @override
  _State createState() => _State();
}

class _State extends State<textfeild> {


  var _formkey2 = GlobalKey<FormState>(); //password textfeild key
  var _formkey3 = GlobalKey<FormState>(); //email textfield key
  FocusNode focusNode;
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  bool SecureInput_pass =  false;

  String hintText ;
  String LabelText ;
// this controls the hide and show password characters

  void initState() {
    super.initState();
    _EmailController.addListener(() { setState(() {}); });
    // this makes the textfeild watching what are you typing
    // and sets the state which causes a rebuild for the function which it will trigger new thing under which is the
    // icon.close Statement.
    focusNode = widget.FoucesNode;
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = 'Search here..';
      }
      setState(() {});
    });
  }

  void dispose() {
    _EmailController.dispose();


    super.dispose();
  }
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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width ;

    return Column(children: [
      Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                spreadRadius: .3,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],

            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          width: w/1.1,
          height: h/10,
          child: Form(

            autovalidateMode: widget.WantSearch?AutovalidateMode.onUserInteraction:null,
            //auto validation turns on with click or something
            key: widget.isEMAIL ? _formkey3 : _formkey2,
            //key depends on which textfield which 2 textfield using this code.
            child: TextFormField(


              textInputAction: widget.TextInputaction,
              controller: widget.isEMAIL ? _EmailController : _PassController,
              onChanged: widget.Onchanged,
              onFieldSubmitted: widget.Onsubmitted,
              focusNode: focusNode,
              validator: widget.WantSearch?null:MultiValidator([
                // the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
                RequiredValidator(errorText: "Required"),
                (widget.isEMAIL
                    ? EmailValidator(errorText: "That's not an Email")
                    : MinLengthValidator(2,
                    errorText: "Password must be Above 2 Characters")),

                MinLengthValidator(6,
                    errorText: "Password must be Above 6 Characters"),
              ]),
              cursorColor: Colors.pinkAccent,
              style: TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                // focusColor: constants.writingONback,
                //   hoverColor: constants.writingONback,

                  border: widget.WantSearch? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: constants.blackBack),

                  ):null,
                 focusedBorder:widget.WantSearch? OutlineInputBorder(

                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                 borderSide: BorderSide(color: constants.blackBack),
                ):null,
                  enabledBorder: widget.WantSearch? OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: constants.blackBack, ),
                  ):null,

                  prefixIcon: widget.isEMAIL?Icon(Icons.email,):Icon(Icons.search,color: constants.writingONback,),
                  filled: true,
                  fillColor: constants.blackBack,

                  contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                  hintText: hintText,
                  labelText: widget.Text2,
                  hintStyle: TextStyle(


                   color: constants.writingONback,
                  ),
                  // we access constructor in statefulWidgets Throw Widget.Var
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: constants.writingONback,
                  ),

                 // border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    //if secureinput which is passed in argument true i need the secure Icon if not DONT NEED IT
                    icon: Icon(widget.WantIcon
                        ? widget.isEMAIL
                        ? (_EmailController.text.isEmpty ? null : Icons.close)
                        : (SecureInput_pass
                            ? Icons.remove_red_eye_outlined
                            : Icons.security):null),

                    onPressed: () {
                      setState(() {
                       if ( widget.isEMAIL && widget.WantIcon){
                             _EmailController.clear();
                             widget.OnIconPressed();
                       }
                            else if (widget.WantIcon)
                            { SecureInput_pass = !SecureInput_pass;}
                      });
                    },
                  )),
              keyboardType: TextInputType.text,
              obscureText: SecureInput_pass,
            ),
          )),

    ]




    );
  }
}
