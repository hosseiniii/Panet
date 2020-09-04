import 'package:flutter/material.dart';
import 'package:panet/ui/buy.dart';
import 'package:panet/ui/basket.dart';
import 'package:panet/ui/orders.dart';

class PlaceholderWidget extends StatelessWidget {
  var index;

  PlaceholderWidget(this.index);


  @override
  Widget build(BuildContext context) {

  if (index == 2) return Buy();
  else if (index == 1) return Basket();
  else return Orders();


  }
}
