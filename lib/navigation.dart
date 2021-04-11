import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class navigation extends StatefulWidget {
  @override
  _navigationState createState() => _navigationState();
}

class _navigationState extends State<navigation> {

  int selectedIndex = 0;

  final tabs = [
    Center(child: Text('Account')),
        Center(child: Text('Posts')),
        Center(child: Text('Likes')),
        Center(child: Text('Settings'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bottom Navigation',
          style: TextStyle(
              color: Colors.white
          ),),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_sharp,
                color: Colors.black38,),
              label: 'Account'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.post_add,color: Colors.black38,),
              label: 'Posts'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny,color: Colors.black38,),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: Colors.black38,),
              label: 'Settings'
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }


  void onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }
}
