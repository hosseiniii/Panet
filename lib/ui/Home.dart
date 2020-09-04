import 'package:flutter/material.dart';
import 'PlaceHolderWidget.dart';
import 'my_drawer.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home> {

  static int _currentIndex = 2;
  final List<Widget> _children = [
    PlaceholderWidget(0),
    PlaceholderWidget(1),
    PlaceholderWidget(2)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "پَنِت" ,
          style:
          TextStyle(
            fontFamily: 'IranYekan',
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xffffbf00),
        centerTitle: true,


      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyle(fontSize: 12 ) ,
        selectedLabelStyle: TextStyle( fontWeight: FontWeight.w500),
        selectedIconTheme: IconThemeData(size: 32.0),

        selectedItemColor: Color(0xff1f1f1f),
        elevation: 4.0,
        backgroundColor: Color(0xffffbf00),
        unselectedItemColor: Color(0x99111111),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt) ,
              title: Text("سفارشات" , style: TextStyle(fontFamily: "IranYekan" , fontSize: 14.0,) ,) ,),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket) ,
              title: Text("سبد خرید" , style: TextStyle(fontFamily: "IranYekan" , fontSize: 14.0,) ,) ,),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart) ,
              title: Text("فروشگاه"  , style: TextStyle(fontFamily: "IranYekan" , fontSize: 14.0,) ,) ,),
        ],
      ),
    );
  }

  onTabTapped(int index) {

    setState(() {
      _currentIndex = index;
    });
  }

}




