// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:assignment_1/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherPage extends StatelessWidget {
  const UrlLauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UrlPage(title: 'Url Launcher Page'),
    );
  }
}

class UrlPage extends StatefulWidget {
  const UrlPage({super.key, required this.title});

  final String title;

  @override
  State<UrlPage> createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('papayacoders : Second field value is ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "URL Launcher Page",
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
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  backgroundColor: Colors.pink,
                ),
                child: Text("Visit Youtube",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),),
                onPressed: () {
                  final snackbar = SnackBar(
                    content: const Text("Visit Youtube"),
                    action: SnackBarAction(
                      label: "Visit Youtube",
                      onPressed: () {
                        const link = "https://www.youtube.com";

                        launchUrl(
                          Uri.parse(link),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  backgroundColor: Colors.blue,
                ),
                child: Text("Call Me",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),),
                onPressed: () {
                  final snackbar = SnackBar(
                    content: const Text("Contact : Me"),
                    action: SnackBarAction(
                      label: "Call Me",
                      onPressed: () {
                        launchUrl(
                          Uri(scheme: 'tel', path: "+94767608035"),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  backgroundColor: Colors.purple,
                ),
                child: Text("Email Me",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),),
                onPressed: () {
                  final snackbar = SnackBar(
                    content: const Text("Email : Me"),
                    action: SnackBarAction(
                      label: "Email",
                      onPressed: () {
                        launchUrl(
                          Uri(scheme: 'mailto', path: "ichathumina2002@gmail.com"),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
