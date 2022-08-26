// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:siska_morgan_wedding_invitation_flutter/homepage.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'dart:io' show Platform;

void main() {
  setPathUrlStrategy();
  String myurl = Uri.base.toString();
  String params = Uri.base.queryParameters["guest"];
  runApp(MyApp(myurl: myurl, params: params));
}

class MyApp extends StatelessWidget {
  String myurl, params;
  MyApp({this.myurl, this.params});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siska & Morgan Wedding',
      home: MyHomePage(params),
    );
  }
}
