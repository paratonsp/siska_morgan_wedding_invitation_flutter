// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx/webviewx.dart';

class PageTwo extends StatefulWidget {
  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  WebViewXController webviewController;

  void _launchMapsUrl() async {
    String lat = "-7.22943243408288";
    String lon = "112.77740624735023";
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    Uri urii = Uri.parse(url);
    if (await canLaunchUrl(urii)) {
      await launchUrl(urii);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height / 1.4;
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Html(
              style: {
                "style.height": Style(height: h),
                "style.width": Style(width: w),
              },
              shrinkWrap: true,
              data:
                  '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3629.5852264837895!2d112.77529155637504!3d-7.230479437561675!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dd7f9b22e815867%3A0xf1defaf23e649e59!2sGg.%20Melon%20No.19%2C%20Bulak%2C%20Kec.%20Bulak%2C%20Kota%20SBY%2C%20Jawa%20Timur%2060129!5e0!3m2!1sid!2sid!4v1660333821134!5m2!1sid!2sid" width="$w" height="$h" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>'),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: CupertinoButton(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Direction"), Icon(Icons.navigate_next)],
            ),
            onPressed: () {
              _launchMapsUrl();
            },
          ),
        ),
      ],
    ));
  }
}
