// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:assignment_1/main.dart';
import 'package:flutter/material.dart';

class BadgesPage extends StatefulWidget {
  const BadgesPage({super.key});

  @override
  State<BadgesPage> createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  int _cartBadgeAmount = 0;
  late bool _showCartBadge;

  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Badges Page",
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
          backgroundColor: Colors.teal,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _shoppingCartBadge(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, 
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {
                      setState(() {
                        _cartBadgeAmount++;
                      });
                    },
                    child: Text('Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: _showCartBadge
                        ? () {
                            setState(() {
                              _cartBadgeAmount--;
                            });
                          }
                        : null,
                    child: Text('Remove from Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return Badge(
      padding: EdgeInsets.all(8),
      backgroundColor: Colors.blue,
      alignment: AlignmentDirectional.topStart,
      largeSize: 30,
      textStyle: TextStyle(fontSize: 14),
      textColor: Colors.white,
      label: Text(_cartBadgeAmount.toString()),
      child: Icon(
        Icons.shopping_cart,
        size: 100,
      ),
      isLabelVisible: _showCartBadge,
    );
  }
}
