import 'dart:io';
import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Widgets/AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File Image2;
  bool selected1 = false;
  bool selected2 = false;

  Future<void> _alreatDialogBuilder() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Choose Between Gallery or Take a photo"),
            content: Container(
              child: Text("you can Use What Ever you Want"),
            ),
            actions: [
              RaisedButton(
                child: Text("Take a photo"),
                onPressed: () {
                  setState(() {
                    selected1 = !selected1;
                    Navigator.pop(context);
                  });
                },
              ),
              SizedBox(
                width: 8,
              ),
              RaisedButton(
                child: Text("Gallery"),
                onPressed: () {
                  setState(() {
                    selected2 = !selected2;
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }

  Future imagePicker(ImageSource source) async {
    try {
      final image2 = await ImagePicker().pickImage(source: source);
      if (image2 == null) return;

      final ImagePath = File(image2.path);
      setState(
        () {
          this.Image2 = ImagePath;
        },
      );
    } on PlatformException catch (e) {
      print("failed to select an image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Properties",
                  style: constants.RegularHeading,
                ),
                RaisedButton(
                    child: Text("Sign Out", style: constants.RegularHeading),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(context, "/login");
                    }),
              ]),
        ),
        appBar: Appbar_Tool(text2: "Your Profile", WantSearch: false),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Center(
              child: Stack(children: [
                CircleAvatar(
                  backgroundImage: Image2 != null ? FileImage(Image2) : null,
                  radius: 70,
                  backgroundColor: Colors.black12,
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: IconButton(
                    iconSize: 35,
                    icon: Icon(Icons.add_a_photo),
                    color: Colors.pink,
                    onPressed: () async {
                      await _alreatDialogBuilder();
                      selected1 ? imagePicker(ImageSource.camera) : null;
                      selected1 = false;
                      selected2 ? imagePicker(ImageSource.gallery) : null;
                      selected2 = false;
                    },
                  ),
                )
              ]),
            ),
            SizedBox(height: 15,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name "),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("boi "),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
