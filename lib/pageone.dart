// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

class PageOne extends StatefulWidget {
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final wedDate = DateTime(2022, 09, 18, 16);
  final date1 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final difference = date1.difference(wedDate).inHours;
    var pos = difference.abs();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).scaffoldBackgroundColor,
                          Colors.transparent
                        ],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      "assets/img/1 (33)-(3).jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Siska & Morgan",
                            style: GoogleFonts.dancingScript(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        Text("We invited you to celebrate our wedding",
                            style: GoogleFonts.lato(fontSize: 14)),
                        Text(
                          "Sunday, 18 September 2022",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SlideCountdownSeparated(
              // separatorType: SeparatorType.title,
              // durationTitle: DurationTitle.idShort(),
              height: 70,
              width: 70,
              duration: Duration(hours: pos),
              textStyle: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
