// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siska_morgan_wedding_invitation_flutter/homepage.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'dart:io' show Platform;

void main() {
  setPathUrlStrategy();
  String myurl = Uri.base.toString();
  String? params = Uri.base.queryParameters["guest"];
  runApp(MyApp(myurl: myurl, params: params));
}

class MyApp extends StatelessWidget {
  String? myurl, params;
  MyApp({required this.myurl, required this.params});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siska & Morgan Wedding',
      home: NextPage(params),
    );
  }
}

class NextPage extends StatefulWidget {
  NextPage(this.params);
  String? params;
  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 300),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(widget.params)),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(),
    );
  }
}
