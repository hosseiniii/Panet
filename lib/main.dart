import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:panet/util/constants.dart';
import 'ui/splashScreen.dart';
import 'package:panet/database/Database.dart';
import 'package:panet/models/bread.dart';


void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xffffbf00),
      title: 'پنت',
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }

}
