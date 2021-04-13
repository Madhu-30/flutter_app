import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/register.dart';
import 'listFollow.dart';
import 'profile.dart';
import 'firebaseRegister.dart';
import 'package:firebase_core/firebase_core.dart';
import 'navigation.dart';
import 'package:flutter_app/newUser.dart';


// void main() =>
//   runApp(MaterialApp(
//     home:Home()));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home:Home()));
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            OutlinedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> profile()));
              },
              autofocus: true,
              clipBehavior: Clip.none,
              child: Text('Profile',
                style: TextStyle(
                  color: Colors.indigo,
                  // backgroundColor: Colors.red,
                ),),
            ),

            TextButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> register()));
              },
              autofocus: true,
              clipBehavior: Clip.none,
              child: Text('Registration',
                style: TextStyle(
                  color: Colors.indigo,
                  // backgroundColor: Colors.red,
                ),),
            ),

            TextButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> firebaseRegister()));
              },
              autofocus: true,
              clipBehavior: Clip.none,
              child: Text('Firebase Sign up',
                style: TextStyle(
                  color: Colors.indigo,
                  // backgroundColor: Colors.red,
                ),
              ),
            ),

            OutlinedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> navigation()));
              },
              autofocus: true,
              clipBehavior: Clip.none,
              child: Text('Navigation',
                style: TextStyle(
                  color: Colors.indigo,
                  // backgroundColor: Colors.red,
                ),),
            ),

          ],
        ),
      ),
    );
  }
}






