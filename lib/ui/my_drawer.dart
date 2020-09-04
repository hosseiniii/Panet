import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'aleartDialog.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20.0,
      child: Container(
        color: Color(0xffffbf00),
        child: Column(children: <Widget>[
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: new Text(
                  "\n\n\n" + "سید صادق حسینی",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "IranYekan",
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                decoration: new BoxDecoration(
                  color: Color(0xffffbf00),
                ),
              ),
              new Container(
                  color: Color(0xffffbf00),
                  child: Column(
                    children: <Widget>[
                      drawerItem(
                          icon: FontAwesomeIcons.phone,
                          text: "پشتیبانی",
                          c: context),
                      drawerItem(
                          icon: CupertinoIcons.book_solid,
                          text: "قوانین و مقررات",
                          c: context),
                      drawerItem(
                          icon: Icons.info,
                          text: "درباره ما",
                          c: context),
                    ],
                  )),
            ],
          )),
          Container(
            padding: EdgeInsets.all(10),
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "نگارش 1.4.1",
                  style: TextStyle(
                      fontFamily: "IranYekanFaNum",
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget drawerItem(
    {BuildContext c, IconData icon, String text, GestureTapCallback onTap}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: new ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Row(
        children: <Widget>[
          Text(
            text,
            style:
                TextStyle(fontFamily: "IranYekan", fontWeight: FontWeight.w500),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
      onTap: () {
        Text title = Text('');
        Text description = Text('');

        if (text == 'پشتیبانی') {
          title = Text(text);
          description = Text(
              'جهت تماس با پشتیبانی و هرگونه انتقاد و پیشنهاد با شماره های زیر تماس حاصل فرمایید' +
                  '\n\n' +
                  'پشتیبانی سفارشات:' +
                  '\n\n' +
                  'پشتیبانی فنی:');
        } else if (text == 'قوانین و مقررات') {
          title = Text(text);
          description = Text('');
        } else if (text == 'درباره ما') {
          title = Text(text);
          description = Text('');
        }

        makeAlert(c, title, description);
      },
    ),
  );
}
