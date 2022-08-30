// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageFour extends StatefulWidget {
  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -30,
            left: -70,
            child: Transform.rotate(
              angle: 0,
              child: Image.asset(
                "assets/decoration/13x.png",
                width: 300,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 200),
                  Text("Wedding Gift",
                      style: GoogleFonts.dancingScript(
                          fontSize: 32, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Image.asset(
                      "assets/qr.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("BCA a/n Dwi Agung Prasetyo",
                      style: GoogleFonts.lato(fontSize: 14)),
                  Text("0640592478", style: GoogleFonts.lato(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
