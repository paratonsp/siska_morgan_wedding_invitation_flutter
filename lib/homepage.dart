// ignore_for_file: avoid_print, prefer_const_constructors, use_key_in_widget_constructors

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:morphing_text/morphing_text.dart';
import 'package:siska_morgan_wedding_invitation_flutter/dashboard.dart';

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
      body: Center(
        child: (!isMobile)
            ? Text("data")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EvaporateMorphingText(
                    texts: text,
                    loopForever: true,
                    onComplete: () {},
                    yDisplacement: 1.2, // To factor of y-displacement
                    textStyle: TextStyle(fontSize: 40.0),
                  ),
                  SizedBox(height: 80),
                  TextButton(
                      onPressed: () {
                        // playAudio();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      },
                      child: Text("Buka Undangan"))
                ],
              ),
      ),
    );
  }
}
