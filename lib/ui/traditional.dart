import 'dart:core';

import 'package:flutter/material.dart';
import 'package:panet/models/bread.dart';
import 'package:panet/ui/buy_row.dart';
import 'package:panet/database/Database.dart';

import 'package:panet/util/constants.dart';
import 'package:sqflite/sqflite.dart';


class TraditionalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var db = new MyDB();

    return Container(
      color: Colors.white,
      child: FutureBuilder<List> (
        initialData: List(),
        future: db.getAllRecords(Constants.TABLE_NAME),
        builder: (context , snapshot) {
          if (snapshot.data.length == 0) {
            addData();
          }
          print("Row1 : " + snapshot.data[1].row[1]);
          print(snapshot.data.length);
          print("Snapshot hasdata: " + snapshot.hasData.toString());
          print(snapshot.data);

          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (_, int position) {
                print("position: " + position.toString());
                final item = snapshot.data[position];
                return Padding(
                  child: BuyRow(item),
                  padding: EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 0),
                );
              },
            );
          }
          else if (snapshot.hasError) {
            print("Error");
            return Text("");
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        },
      )

    );
  }
}


addData() async{

  var db = new MyDB();

  Bread sangakSade   = new Bread('images/ic_sangak.png', 1200, 'سنگک ساده');
  Bread sangakYeRou  = new Bread('images/ic_sangak.png', 3000, 'سنگک یک بر کنجد');
  Bread sangakDoRou  = new Bread('images/ic_sangak.png', 3500, 'سنگک دو بر کنجد');


  int add1 = await db.addBread(sangakSade);
  int add2 = await db.addBread(sangakYeRou);
  int add3 = await db.addBread(sangakDoRou);

  if (add1==1 && add2==1 && add3==1) print("Successfuly Added!");

}

