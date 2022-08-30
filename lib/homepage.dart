// ignore_for_file: avoid_print, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, unused_import

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morphing_text/morphing_text.dart';
import 'package:siska_morgan_wedding_invitation_flutter/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.params);
  String? params;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  String par = "";

  playAudio() {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/music.mp3"),
      autoStart: true,
      showNotification: false,
      loopMode: LoopMode.single,
    );
  }

  @override
  void initState() {
    par = widget.params.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;
    List<String> text = [
      "Selamat Datang",
      par,
    ];
    return Scaffold(
      body: (!isMobile)
          ? Center(
              child: SingleChildScrollView(
                child: Text("Please open on your phone!"),
              ),
            )
          : Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
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
                      "assets/img/1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("We invited you to celebrate our wedding",
                            style: GoogleFonts.lato(fontSize: 12)),
                        SizedBox(height: 10),
                        Text("Siska & Morgan",
                            style: GoogleFonts.dancingScript(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        // Text("Wedding", style: GoogleFonts.lato(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Kepada Yth:",
                            style: GoogleFonts.lato(fontSize: 14)),
                        Text(par,
                            style: GoogleFonts.dancingScript(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        CupertinoButton(
                            color: Colors.grey,
                            onPressed: () {
                              playAudio();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()),
                              );
                            },
                            child: Text("Buka Undangan")),
                      ],
                    ),
                  ),
                ),
                // Center(
                //   child: (!isMobile)
                //       ? Text("data")
                //       : Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text("Siska & Morgan",
                //                 style: GoogleFonts.dancingScript(
                //                     fontSize: 40, fontWeight: FontWeight.bold)),
                //             Text("Wedding", style: GoogleFonts.lato(fontSize: 20)),
                //             SizedBox(height: 20),
                //             Text("We invited you to celebrate our wedding",
                //                 style: GoogleFonts.lato(fontSize: 14)),
                //             Text(
                //               "Sunday, 18 September 2022",
                //               style: GoogleFonts.lato(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             SizedBox(height: 80),
                //             EvaporateMorphingText(
                //               texts: text,
                //               loopForever: true,
                //               onComplete: () {},
                //               yDisplacement: 1.2, // To factor of y-displacement
                //               textStyle: TextStyle(fontSize: 40.0),
                //             ),
                //             SizedBox(height: 40),
                //             Text("Kepada Yth:",
                //                 style: GoogleFonts.lato(fontSize: 14)),
                //             Text(par,
                //                 style: GoogleFonts.dancingScript(
                //                     fontSize: 20, fontWeight: FontWeight.bold)),
                //             SizedBox(height: 20),

                //             TextButton(
                //                 onPressed: () {
                //                   // playAudio();
                //                   Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) => Dashboard()),
                //                   );
                //                 },
                //                 child: Text("Buka Undangan"))
                //           ],
                //         ),
                // ),
              ],
            ),
    );
  }
}
