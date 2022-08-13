// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, avoid_print

import 'package:animated_image_list/AnimatedImageList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_deck/swipe_deck.dart';

class PageThree extends StatefulWidget {
  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  List IMAGES = [
    "_MG_0080",
    "_MG_0082",
    "1 (6)-4",
    "1 (7)-4",
    "1 (8)-2",
  ];
  final borderRadius = BorderRadius.circular(20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Text("Gallery",
                style: GoogleFonts.dancingScript(
                    fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 80),
            Container(
              child: SwipeDeck(
                startIndex: 3,
                emptyIndicator: Container(
                  child: Center(
                    child: Text("Nothing Here"),
                  ),
                ),
                cardSpreadInDegrees: 5,
                widgets: IMAGES
                    .map((e) => GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                              borderRadius: borderRadius,
                              child: Image.asset(
                                "assets/img/$e.jpg",
                                fit: BoxFit.cover,
                              )),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
