// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:siska_morgan_wedding_invitation_flutter/homepage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'dart:io' show Platform;

void main() {
  setPathUrlStrategy();
  String myurl = Uri.base.toString();
  String? params = Uri.base.queryParameters["params"];
  runApp(MyApp(myurl: myurl, params: params));
}

class MyApp extends StatelessWidget {
  String? myurl, params;
  MyApp({this.myurl, this.params});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(params),
    );
  }
}
