// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, avoid_print, unused_import

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
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  final borderRadius = BorderRadius.circular(20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: -150,
          left: -150,
          child: Transform.rotate(
            angle: 0,
            child: Image.asset(
              "assets/decoration/4x.png",
              width: 500,
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 200),
                Text("Gallery",
                    style: GoogleFonts.dancingScript(
                        fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 60),
                Container(
                  child: SwipeDeck(
                    startIndex: 5,
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
        ),
      ],
    ));
  }
}
