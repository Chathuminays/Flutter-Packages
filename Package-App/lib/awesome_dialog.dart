// ignore_for_file: prefer_const_constructors

import 'package:assignment_1/main.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Awesome extends StatefulWidget {
  const Awesome({super.key});

  @override
  State<Awesome> createState() => _AwesomeState();
}

class _AwesomeState extends State<Awesome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Awesome Dialog Page",
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
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedButton(
                    text: 'Warning Dialog',
                    color: Colors.orange,
                    pressEvent: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                        width: 280,
                        buttonsBorderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        ),
                        dismissOnTouchOutside: true,
                        dismissOnBackKeyPress: false,
                        onDismissCallback: (type) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Dismissed by $type'),
                            ),
                          );
                        },
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'Warning !',
                        desc: 'This is a warning message for you.',
                        showCloseIcon: true,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedButton(
                    text: 'Error Dialog',
                    color: Colors.red,
                    pressEvent: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        width: 280,
                        buttonsBorderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        ),
                        dismissOnTouchOutside: true,
                        dismissOnBackKeyPress: false,
                        onDismissCallback: (type) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Dismissed by $type'),
                            ),
                          );
                        },
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'Error !',
                        desc: 'This is an error message for you.',
                        showCloseIcon: true,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedButton(
                    text: 'Success Dialog',
                    color: Colors.green,
                    pressEvent: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                        width: 280,
                        buttonsBorderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        ),
                        dismissOnTouchOutside: true,
                        dismissOnBackKeyPress: false,
                        onDismissCallback: (type) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Dismissed by $type'),
                            ),
                          );
                        },
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'Success !',
                        desc: 'This is a success message for you.',
                        showCloseIcon: true,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedButton(
                    text: 'Info Dialog',
                    color: Colors.blue,
                    pressEvent: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.info,
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                        width: 280,
                        buttonsBorderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        ),
                        dismissOnTouchOutside: true,
                        dismissOnBackKeyPress: false,
                        onDismissCallback: (type) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Dismissed by $type'),
                            ),
                          );
                        },
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'Info !',
                        desc: 'This is a info message for you.',
                        showCloseIcon: true,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedButton(
                    text: 'No Header Dialog',
                    color: Colors.yellow,
                    pressEvent: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.noHeader,
                        borderSide: const BorderSide(
                          color: Colors.yellow,
                          width: 2,
                        ),
                        width: 280,
                        buttonsBorderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        ),
                        dismissOnTouchOutside: true,
                        dismissOnBackKeyPress: false,
                        onDismissCallback: (type) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Dismissed by $type'),
                            ),
                          );
                        },
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'No Header!',
                        desc: 'This is a no header message for you.',
                        showCloseIcon: true,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
