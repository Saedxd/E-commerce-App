import 'package:commerce_app/UI/Constants/constants.dart';
import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/Widgets/Custom_Textfield.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode focusNode = FocusNode();

  // String HintText;
  @override
  void initState() {
    super.initState();
    //
    // focusNode.addListener(() {
    //
    //   if (focusNode.hasFocus) {
    //      HintText = '';
    //   } else {
    //     HintText = "Search Here..";
    //   }
    //   setState(() {});
    // });
  }

  Homepage instance = Homepage();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: constants.blackBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 27,
                      color: constants.pinkColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h / 33,
              ),
              Container(
                // color: Colors.pink,
                width: w / 1.1,
                height: h / 10,
                child: textfeild(
                  WantSearch: true,
                  FoucesNode: focusNode,
                  WantIcon: false,
                  Text2: "Search",
                  isEMAIL: false,
                  Onchanged: (value) {},
                  OnIconPressed: () {},
                  Onsubmitted: (value) {},
                  // FoucesNode: ,
                  // TextInputaction: ,
                ),
              ),
              SizedBox(
                height: h / 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: w / 20,
                  ),
                  Container(
                    width: w / 3,
                    child: Text(
                      "Search Results",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  //  color: Colors.pink,
                  padding: EdgeInsets.only(right: w / 22, left: w / 50),

                  //  color: Colors.green,
                  width: w,
                  height: h / 1.401,
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            height: 5,
                          ),
                      scrollDirection: Axis.vertical,
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return instance.listtiles[index];
                        //Container(
                        //   width: 200,
                        //   height: 100,
                        // );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
