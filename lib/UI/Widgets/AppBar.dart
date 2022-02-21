import 'package:commerce_app/UI/Cart_Screen/Pages/Cart.dart';
import 'package:flutter/material.dart';
class Appbar_Tool extends StatelessWidget implements PreferredSizeWidget {
   String text2;// for App bar Title.
   bool WantSearch;// if you wanted search Icon Button. Constructor Does the work.


  Appbar_Tool({this.text2,this.WantSearch});



  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: Text(text2),
      centerTitle: true,
      backgroundColor: Colors.pink[900],
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Cart() ),
              );
            },

          icon: Icon(Icons.shopping_cart_rounded)) ],

      leading: WantSearch ? IconButton(onPressed: (){},  icon: Icon(Icons.search)) : null
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}
