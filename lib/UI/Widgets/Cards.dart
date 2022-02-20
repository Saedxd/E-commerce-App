// import 'package:flutter/material.dart';
//
// Widget _buildCard(String name, String price, String imgPath, bool added,
//     bool isFavorite, context) {
//   return Padding(
//       padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
//       child: InkWell(
//           onTap: () {
//             // Navigator.of(context).push(
//             //     MaterialPageRoute(builder: (context) => CookieDetail(
//             //         assetPath: imgPath,
//             //         cookieprice:price,
//             //         cookiename: name
//             //     )));
//           },
//           child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 3.0,
//                         blurRadius: 5.0)
//                   ],
//                   color: Colors.white
//               ),
//               child: Column(children: [
//                 Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           isFavorite
//                               ? Icon(Icons.favorite, color: Color(0xFFEF7532))
//                               : Icon(Icons.favorite_border,
//                               color: Color(0xFFEF7532))
//                         ])),
//                 Hero(
//                     tag: imgPath,
//                     child: Container(
//                         height: 75.0,
//                         width: 75.0,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage(imgPath),
//                                 fit: BoxFit.contain)))),
//                 SizedBox(height: 7.0),
//                 Text(price,
//                     style: TextStyle(
//                         color: Color(0xFFCC8053),
//                         fontFamily: 'Varela',
//                         fontSize: 14.0)),
//                 Text(name,
//                     style: TextStyle(
//                         color: Color(0xFF575E67),
//                         fontFamily: 'Varela',
//                         fontSize: 14.0)),
//                 Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
//                 Padding(
//                     padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           if (!added) ...[
//                             Icon(Icons.shopping_basket,
//                                 color: Color(0xFFD17E50), size: 12.0),
//                             Text('Add to cart',
//                                 style: TextStyle(
//                                     fontFamily: 'Varela',
//                                     color: Color(0xFFD17E50),
//                                     fontSize: 12.0))
//                           ],
//                           if (added) ...[
//                             Icon(Icons.remove_circle_outline,
//                                 color: Color(0xFFD17E50), size: 12.0),
//                             Text('3',
//                                 style: TextStyle(
//                                     fontFamily: 'Varela',
//                                     color: Color(0xFFD17E50),
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12.0)),
//                             Icon(Icons.add_circle_outline,
//                                 color: Color(0xFFD17E50), size: 12.0),
//                           ]
//                         ]
//                     )
//                 )
//               ]))));
// }
//
//
//
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
//  Container(
//
//         decoration: BoxDecoration(
//           color: Colors.black12,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//             bottomRight: Radius.circular(20),
//             bottomLeft: Radius.circular(20),
//           ),
//         ),
//         width: width,
//         height: height,
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
//
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
//             ],)
//           );
//
//
//          */
//