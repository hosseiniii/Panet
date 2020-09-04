import 'package:flutter/material.dart';
import 'dart:async';

Future<void> makeAlert(BuildContext c , Text title , Text description) {

  return showDialog<void>(
    context: c,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          elevation: 10,
          backgroundColor: Color(0xffffffff),
          titleTextStyle: TextStyle(fontFamily: "IranYekan" , color: Colors.black , fontWeight: FontWeight.w800 ),
          title: title,
          contentTextStyle: TextStyle(fontFamily: "IranYekanFaNum" , color: Colors.black , height: 1.2 ,),
          content: description,
          actions: <Widget>[
            FlatButton(
              child: Text('خب' , style: TextStyle(fontFamily: "IranYekan" , color: Color(0xffffbf00)),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}