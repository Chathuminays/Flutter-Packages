// ignore_for_file: prefer_const_constructors

import 'package:assignment_1/main.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class CoachMarkPage extends StatefulWidget {
  const CoachMarkPage({Key? key}) : super(key: key);

  @override
  State<CoachMarkPage> createState() => _CoachMarkPageState();
}

class _CoachMarkPageState extends State<CoachMarkPage> {
  final GlobalKey _floatingButtonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _createTutorial();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Tutorial Coach Mark Page",
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
        body: ListView.separated(
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            final element = 'Element $index';
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListTile(
                title: Text(element),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Padding(
            padding: EdgeInsets.only(left: 68.0),
            child: Divider(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          key: _floatingButtonKey,
          onPressed: () {
            // Do nothing
          },
          tooltip: 'Floating action',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> _createTutorial() async {
    final targets = [
      TargetFocus(
        identify: 'floatingButton',
        keyTarget: _floatingButtonKey,
        alignSkip: Alignment.topCenter,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) => Text(
              'Use this button to add new elements to the list',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    ];

    final tutorial = TutorialCoachMark(
      targets: targets,
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      tutorial.show(context: context);
    });
  }
}
