// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidablePage extends StatelessWidget {
  const SlidablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Slidable Page",
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
          backgroundColor: Colors.pinkAccent,
        ),
        body: _buildContactList(),
      ),
    );
  }

  Widget _buildContactList() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0), 
            child: _buildContactItem(index),
          );
        },
      ),
    );
  }

  Widget _buildContactItem(int index) {
    String contactName = "Contact $index";
    String phoneNumber = "123-456-7890";
    String imageAsset = 'assets/contact$index.png'; 

    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.green,
            onPressed: (context) {},
            icon: Icons.phone,
          ),
          SlidableAction(
            backgroundColor: Colors.blue,
            onPressed: (context) {},
            icon: Icons.chat,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            onPressed: (context) {},
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        color: Colors.white12,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imageAsset),
            radius: 20,
          ),
          title: Text(contactName),
          subtitle: Text(phoneNumber),
        ),
      ),
    );
  }
}
