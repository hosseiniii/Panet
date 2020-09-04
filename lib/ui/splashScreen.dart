import 'dart:async';

import 'package:flutter/material.dart';
import 'package:panet/ui/Home.dart';


class SplashScreen extends StatefulWidget {

  @override
    State createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State {

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffbf00),
        image: DecorationImage(
            image: AssetImage('images/ic_panet.png'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
        SizedBox(height: 20.0,),
        Text(
          "پَنِت" ,
          style: TextStyle(
              fontFamily: "IranYekan" ,
              fontWeight: FontWeight.w800 ,
              color: Colors.white ,
              fontSize: 35 ,
              shadows: [Shadow(color: Colors.black , blurRadius: 7,)],
            decoration: TextDecoration.none
          ),
        ),
        SizedBox(height: 80,),
        Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),

          SizedBox(height: 70,)

        ],
      )

    );
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }

}

