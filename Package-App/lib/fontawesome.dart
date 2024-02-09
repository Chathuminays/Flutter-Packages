// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:assignment_1/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesome extends StatefulWidget {
  const FontAwesome({Key? key}) : super(key: key);

  @override
  _FontAwesomeState createState() => _FontAwesomeState();
}

class _FontAwesomeState extends State<FontAwesome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Font Awesome Page",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white70,
            iconSize: 25,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Icon(
                  _getIconData(index),
                  size: 50,
                  color: _getIconColor(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconData(int index) {
    switch (index % 20) {
      case 0:
        return FontAwesomeIcons.facebook;
      case 1:
        return FontAwesomeIcons.twitter;
      case 2:
        return FontAwesomeIcons.instagram;
      case 3:
        return FontAwesomeIcons.whatsapp;
      case 4:
        return FontAwesomeIcons.apple;
      case 5:
        return FontAwesomeIcons.android;
      case 6:
        return FontAwesomeIcons.linkedin;
      case 7:
        return FontAwesomeIcons.github;
      case 8:
        return FontAwesomeIcons.google;
      case 9:
        return FontAwesomeIcons.spotify;
      case 10:
        return FontAwesomeIcons.amazon;
      case 11:
        return FontAwesomeIcons.chrome;
      case 12:
        return FontAwesomeIcons.microsoft;
      case 13:
        return FontAwesomeIcons.snapchat;
      case 14:
        return FontAwesomeIcons.twitch;
      case 15:
        return FontAwesomeIcons.etsy;
      case 16:
        return FontAwesomeIcons.pinterest;
      case 17:
        return FontAwesomeIcons.tumblr;
      case 18:
        return FontAwesomeIcons.reddit;
      case 19:
        return FontAwesomeIcons.dribbble;
      default:
        return FontAwesomeIcons.facebook;
    }
  }

  Color _getIconColor(int index) {
    switch (index % 5) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.red;
      case 2:
        return Colors.green;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }
}
