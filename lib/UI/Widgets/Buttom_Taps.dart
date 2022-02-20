import 'package:commerce_app/UI/Cart_Screen/Pages/Cart.dart';
import 'package:commerce_app/UI/Favorite_Screen/Pages/Favorite.dart';
import 'package:commerce_app/UI/Home_Screen/page/home_Page.dart';
import 'package:commerce_app/UI/Profile_Screen/Pages/Porfile.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/UI/Widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/TabItem.dart';
import 'package:motion_tab_bar/motiontabbar.dart';


class Buttom_tabs extends StatefulWidget {
  @override
  State<Buttom_tabs> createState() => _MyStatefulButtom_tabs();
}

class _MyStatefulButtom_tabs extends State<Buttom_tabs> with SingleTickerProviderStateMixin {
  // int _selectedIndex = 0;
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  // static  List _widgetOptions = [
  //   HomePage(),
  //   Favorite(),
  //   HomePage(),
  //   Cart(),
  //   Profile(),
  // ];

  MotionTabController _tabController;


  @override
  void initState()
  {
  super.initState();
  _tabController = new MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
  super.dispose();
  _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
    
    body: Container(
      child: MotionTabBarView(


      children:[
        Profile(),
        HomePage(),
        Favorite(),
      ],
        controller: _tabController,
      ),
    ),
    bottomNavigationBar :
    MotionTabBar(
    labels: [

    "Account", "Home", "Favorite"
    ],


    initialSelectedTab: "Home",
    tabIconColor: Colors.amberAccent,
    tabSelectedColor: Colors.blue,
    onTabItemSelected: (int value) {
    print(value);
    setState(() {
    _tabController.index = value;
    });
    },
    icons: [
    Icons.account_box, Icons.home, Icons.favorite
    ],
    textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),

    ),


    ),
  );
  }
  }



