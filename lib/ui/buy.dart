import 'package:flutter/material.dart';
import 'package:panet/ui/traditional.dart';

class Buy extends StatefulWidget {
  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  @override
  Widget build(BuildContext context) {
    return MyTabBar();
  }
}

class MyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 1,

        child: Scaffold(
          backgroundColor: Color(0xffffbf00),
          appBar: new TabBar(

            onTap: onTabTap,
            indicatorColor: Color(0xff000000),
            labelStyle: TextStyle(fontFamily: "IranYekan" , fontWeight: FontWeight.w500),
            unselectedLabelColor: Color(0x99111111),
            labelColor: Color(0xff000000),
              tabs: [
                Tab(text: "نان فانتزی",),
                Tab(text: "نان سنتی",),
              ],
            ),

         body: TabBarView(
            children: [
              Container(color: Colors.white),
              TraditionalList()
            ],
          ),
        ),
      );
  }
}

onTabTap (index) {
  print("index: " + index.toString());
  if (index == 1){
    print("1");

  }
  else{
    print("0");
  }
}
