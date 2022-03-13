//
// import 'package:flutter/material.dart';
// class Custom_Appbar extends StatelessWidget implements PreferredSizeWidget {
//    String text2;// for App bar Title.
//    bool WantSearch;// if you wanted search Icon Button. Constructor Does the work.
//    final WantCart;
//
//    Custom_Appbar({this.text2,this.WantSearch,this.WantCart});
//
//
// //url lancher.
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//        // automaticallyImplyLeading: false,
//
//       title: Text(text2),
//       centerTitle: true,
//       backgroundColor: Colors.pink[900],
//
//       actions: [
//
//         WantCart
//             ? IconButton(
//
//             onPressed: () {
//               Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => Cart() ),
//               );
//             },
//
//             icon:
//             Icon(Icons.shopping_cart_rounded)
//
//
//         )
//             :Text(" ")
//
//       ],
//
//       leading: WantSearch ? IconButton(onPressed: (){},  icon: Icon(Icons.search)) : null
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(60.0);
// }
