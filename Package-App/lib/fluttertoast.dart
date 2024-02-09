// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastPage extends StatelessWidget {
  const FlutterToastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "FlutterToast Page",
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
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    showCustom(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                  child: Text('Show Custom Toast',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showCustom(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'This is a Bottom Custom Toast.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.BOTTOM,
    );
  }
}


