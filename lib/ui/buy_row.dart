import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


BuyRow(item) {
  return new  Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            child: Image(
              image: AssetImage(
                item.row[3],
              ),
              fit: BoxFit.fitHeight,
              height: 110,
              width: 100,
            ),
            padding: EdgeInsets.only(top: 10 , bottom: 10),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: Text(0.toString() , style: TextStyle(fontFamily: "IranYekanFaNum" , fontSize: 19 , ),),
                    ),
                    Icon(Icons.remove)
                  ],
                ),
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                Text(
                    item.row[1].toString() ,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: "IranYekanFaNum" ,
                      fontWeight: FontWeight.w800 ,
                      fontSize: 18,
                    )),
                Padding(
                  child: Row(
                    children: <Widget>[
                      Text("تومان " , style: TextStyle(fontFamily: "IranYekanFaNum" , fontSize: 18)),
                      Text(item.row[2].toString() , style: TextStyle(fontFamily: "IranYekanFaNum" , fontSize: 18)),
                    ],
                  ),
                  padding: EdgeInsets.only(top: 30),
                )
              ],
            ),
          )





        ],
      )
  );
}
