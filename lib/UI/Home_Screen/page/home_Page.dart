import 'package:commerce_app/DataBase/Database.dart';
import 'package:commerce_app/UI/Cart_Screen/Pages/Cart.dart';
import 'package:commerce_app/UI/Product_Screen/Pages/Product.dart';
import 'package:commerce_app/UI/Widgets/AppBar.dart';
import 'package:commerce_app/UI/Widgets/Buttom_Taps.dart';
import 'package:commerce_app/UI/Widgets/Cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Widgets/Cards.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

// child: FlatButton(
// onPressed: () {
// FirebaseAuth.instance.signOut();
// },
class _HomePageState extends State<HomePage> {
  var db = new Mysql();
  var mail = "";
  int num = 0;
  bool isAdded = false;
  bool isFovarite = false;

  // void _getCustomer() {
  //   db.getConnection().then((conn) {
  //     String sql = 'select mail from company.customer where id = 10;';
  //     conn.query(sql).then((results) {
  //       for(var row in results){
  //         setState(() {
  //           mail = row[0];
  //         });
  //       }
  //     });
  //     conn.close();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 3.6;
    var width = MediaQuery.of(context).size.width / 1;
    return SafeArea(
      child: Scaffold(
        appBar: Appbar_Tool(
          text2: "Home",
          WantSearch: true,
        ),
        body:
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        child: Carousel(
                          dotIncreasedColor: Colors.amberAccent,
                          boxFit: BoxFit.cover,
                          dotColor: Colors.black,
                          dotSpacing: 10,
                          dotSize: 6,
                          indicatorBgPadding: 0,
                          dotPosition: DotPosition.bottomRight,
                          dotVerticalPadding: 10,
                          dotHorizontalPadding: 55,
                          dotBgColor: Colors.transparent,
                          images: [
                            Image.asset("Assets/Images/logo11.png"),
                            Image.asset("Assets/Images/logo4.png"),
                            Image.asset("Assets/Images/logo12.png"),
                          ],
                        ),
                        width: width,
                        height: height,
                      ),
                      Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "  New Products",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text("                                  "),
                            FlatButton.icon(
                              onPressed: () {
                                print(mail);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Product()),
                                );
                              },
                              label: Image.asset(
                                "Assets/Images/trans.png",
                                height: 20,
                                width: 20,
                              ),
                              icon: Text(
                                "See More",
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),

                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Card2[index];
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "  Best Products",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("                                  "),
                    FlatButton.icon(//this could be a container
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Product()),
                        );
                      },
                      label: Image.asset(
                        "Assets/Images/trans.png",
                        height: 20,
                        width: 20,
                      ),
                      icon: Text(
                        " See More",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),

                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Card2[index];
                            }),
                      ),
            ]),
              ),
      ),
    );
  }

  List<Widget> Card2 = <Widget>[
    _buildCard(
      'Cookie cream',
      '\$5.99',
      'Assets/Images/logo1.png',
      false,
      true,
    ),
    _buildCard(
      'Cookie lol',
      '\$7.99',
      'Assets/Images/logo4.png',
      false,
      false,
    ),
    _buildCard(
      'Cookie ez',
      '\$6.99',
      'Assets/Images/logo12.png',
      false,
      false,
    ),
    _buildCard(
      'Cookie xd',
      '\$5.99',
      'Assets/Images/logo11.png',
      false,
      false,
    ),
    _buildCard(
      'Cookie as',
      '\$4.99',
      'Assets/Images/logo3.png',
      false,
      false,
    ),
    _buildCard(
      'Cookie sa',
      '\$3.99',
      'Assets/Images/logo2.jpg',
      false,
      false,
    ),

  ];

}

Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite,  ) {
  return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => CookieDetail(
            //         assetPath: imgPath,
            //         cookieprice:price,
            //         cookiename: name
            //     )));
          },
          child: Container(
              width: 180,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0),
                  ],
                  color: Colors.white),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isFavorite
                              ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                              : Icon(Icons.favorite_border,
                                  color: Color(0xFFEF7532))
                        ])),
                Hero(
                    tag: imgPath,
                    child: Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)))),
                SizedBox(height: 7.0),
                Text(price,
                    style: TextStyle(
                        color: Color(0xFFCC8053),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                SizedBox(height: 7.0),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                SizedBox(height: 90.0),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (!added) ...[
                            Icon(Icons.shopping_basket,
                                color: Color(0xFFD17E50), size: 12.0),
                            Text('Add to cart',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontSize: 12.0))
                          ],
                          if (added) ...[
                            IconButton(
                              onPressed: () {

                              },
                              icon: Icon(Icons.remove_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                            ),
                            Text('3',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0)),
                            IconButton(
                              onPressed: () {

                              },
                              icon: Icon(Icons.add_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                            ),
                          ]
                        ]))
              ]))));
}

//
// class Cards extends StatefulWidget {
//   double price;
//   String name;
//
//   Cards({this.name, this.price});
//
//   @override
//   _CardsState createState() => _CardsState();
// }
//
// class _CardsState extends State<Cards> {
//   bool selected = false;
//   bool selected2 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Container(
//         decoration: BoxDecoration(
//           color: Colors.black12,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//             bottomRight: Radius.circular(20),
//             bottomLeft: Radius.circular(20),
//           ),
//         ),
//         width: 185,
//         height: 250,
//         child: Stack(children: [
//           Positioned(
//             top: 10,
//             right: 5,
//             child: IconButton(
//               icon: Icon(Icons.favorite),
//               onPressed: () {
//                 print("lol");
//                 setState(() {
//                   selected = !selected;
//                 });
//               },
//               color: selected ? Colors.red[900] : Colors.white,
//             ),
//           ),
//           Column(
//             children: [
//               Container(
//                 child: Image.asset(
//                     "Assets/Images/watch-png-hd-download-png-image-watch-png-hd-1.png"),
//                 width: 100,
//                 height: 111,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(20),
//                     bottomLeft: Radius.circular(20),
//                   ),
//                 ),
//                 width: 200,
//                 height: 139,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text("${widget.name}"),
//                     Text("\$ ${widget.price.toString()}"),
//                     Container(
//                       width: 135,
//                       height: 30,
//                       child: RaisedButton(
//                         child: Text(
//                           selected2 ? "Remove From Cart" : "Add to Cart",
//                           style: TextStyle(fontSize: 10.9),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             selected2 = !selected2;
//                           });
//                         },
//                         color: Colors.green,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ]),
//       ),
//     ]);
//
//     /*
//         color: Colors.blue,
//         height: 250,
//         width: 150,
//         decoration: BoxDecoration(
//         color: Colors.amber,
//         borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(30),
//     topRight: Radius.circular(30),
//     bottomRight: Radius.circular(30),
//     bottomLeft: Radius.circular(30),
//     ),
//     child :  Column(
//
//     children : [
//     Container(
//
//     boxShadow: [
//     BoxShadow(offset: Offset(0, 10), blurRadius: 10, color: Colors.blue),
//     ],
//     image: DecorationImage(
//     image: AssetImage("Assets/Images/watch-png-hd-download-png-image-watch-png-hd-1.png"),
//
//     ),
//     )
//     ,
//     ]
//     )
//     ,
//     );
//   }
// }
//
//          */
//   }
// }
