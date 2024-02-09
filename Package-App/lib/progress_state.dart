// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'dart:async';
import 'dart:math';

import 'package:assignment_1/main.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProgressButtonHomePage(title: 'Progress Button'),
    );
  }
}

class ProgressButtonHomePage extends StatefulWidget {
  ProgressButtonHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProgressButtonHomePageState createState() => _ProgressButtonHomePageState();
}

class _ProgressButtonHomePageState extends State<ProgressButtonHomePage> {

  
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateOnlyCustomIndicatorText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  ButtonState stateTextWithIconMinWidthState = ButtonState.idle;

  Widget buildCustomButton() {
    var progressTextButton = ProgressButton(
      stateWidgets: {
        ButtonState.idle: Text(
          "Continue",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.loading: Text(
          "Loading",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.fail: Text(
          "Fail",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.success: Text(
          "Success",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        )
      },
      stateColors: {
        ButtonState.idle: Colors.pink,
        ButtonState.loading: Colors.blue.shade300,
        ButtonState.fail: Colors.red.shade300,
        ButtonState.success: Colors.green.shade400,
      },
      onPressed: onPressedCustomButton,
      state: stateOnlyText,
      padding: EdgeInsets.all(8.0),
      maxWidth: 300,
      height: 50,
    );
    return progressTextButton;
  }

  Widget buildCustomProgressIndicatorButton() {
    var progressTextButton = ProgressButton(
      stateWidgets: {
        ButtonState.idle: Text(
          "Done",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.loading: Text(
          "Loading",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.fail: Text(
          "Fail",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.success: Text(
          "Success",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        )
      },
      progressIndicator:  CircularProgressIndicator( backgroundColor: Colors.white, valueColor: AlwaysStoppedAnimation(Colors.red), strokeWidth: 1, ),
      stateColors: {
        ButtonState.idle: Colors.blue,
        ButtonState.loading: Colors.blue.shade300,
        ButtonState.fail: Colors.red.shade300,
        ButtonState.success: Colors.green.shade400,
      },
      onPressed: onPressedCustomIndicatorButton,
      state: stateOnlyCustomIndicatorText,
      padding: EdgeInsets.all(8.0),
      maxWidth: 300,
      height: 50,
    );
    return progressTextButton;
  }

  Widget buildTextWithIcon() {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: "Send",
          icon: Icon(Icons.send, color: Colors.white),
          color: Colors.deepPurple),
      ButtonState.loading:
          IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
      ButtonState.fail: IconedButton(
          text: "Failed",
          icon: Icon(Icons.cancel, color: Colors.white),
          color: Colors.red.shade300),
      ButtonState.success: IconedButton(
          text: "",
          icon: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Colors.green.shade400)
    }, onPressed: onPressedIconWithText, state: stateTextWithIcon);
  }

  Widget buildTextWithIconWithMinState() {
    return ProgressButton.icon(
      iconedButtons: {
        ButtonState.idle: IconedButton(
            text: "Send",
            icon: Icon(Icons.send, color: Colors.white),
            color: Colors.amber),
        ButtonState.loading:
            IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
        ButtonState.fail: IconedButton(
            text: "Failed",
            icon: Icon(Icons.cancel, color: Colors.white),
            color: Colors.red.shade300),
        ButtonState.success: IconedButton(
            icon: Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            color: Colors.green.shade400)
      },
      onPressed: onPressedIconWithMinWidthStateText,
      state: stateTextWithIconMinWidthState,
      minWidthStates: [ButtonState.loading, ButtonState.success],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress State Button Page",
          style:TextStyle(
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
                       Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
                     },),
          backgroundColor: Colors.green,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCustomButton(),
            Container(
              height: 32,
            ),
            buildTextWithIcon(),
            Container(
              height: 32,
            ),
            buildTextWithIconWithMinState(),
            Container(height: 32,),
            buildCustomProgressIndicatorButton()
          ],
        ),
      ),
    );
  }

  void onPressedCustomButton() {
    setState(() {
      switch (stateOnlyText) {
        case ButtonState.idle:
          stateOnlyText = ButtonState.loading;
          break;
        case ButtonState.loading:
          stateOnlyText = ButtonState.fail;
          break;
        case ButtonState.success:
          stateOnlyText = ButtonState.idle;
          break;
        case ButtonState.fail:
          stateOnlyText = ButtonState.success;
          break;
      }
    });
  }

  void onPressedCustomIndicatorButton() {
    setState(() {
      switch (stateOnlyCustomIndicatorText) {
        case ButtonState.idle:
          stateOnlyCustomIndicatorText = ButtonState.loading;
          break;
        case ButtonState.loading:
          stateOnlyCustomIndicatorText = ButtonState.fail;
          break;
        case ButtonState.success:
          stateOnlyCustomIndicatorText = ButtonState.idle;
          break;
        case ButtonState.fail:
          stateOnlyCustomIndicatorText = ButtonState.success;
          break;
      }
    });
  }


  void onPressedIconWithText() async {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            stateTextWithIcon = Random.secure().nextBool()
                ? ButtonState.success
                : ButtonState.fail;
          });
        });

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }

  void onPressedIconWithMinWidthStateText() {
    switch (stateTextWithIconMinWidthState) {
      case ButtonState.idle:
        stateTextWithIconMinWidthState = ButtonState.loading;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            stateTextWithIconMinWidthState = Random.secure().nextBool()
                ? ButtonState.success
                : ButtonState.fail;
          });
        });

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIconMinWidthState = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIconMinWidthState = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIconMinWidthState = stateTextWithIconMinWidthState;
    });
  }
}