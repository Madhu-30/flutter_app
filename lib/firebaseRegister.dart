import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'usermanagement.dart';

class firebaseRegister extends StatefulWidget {
  @override
  _firebaseRegisterState createState() => _firebaseRegisterState();
}

class _firebaseRegisterState extends State<firebaseRegister> {

  final formkey = GlobalKey<FormState>();
  final pController = TextEditingController();
  final confirmPController = TextEditingController();

  String email, password;
  String mobile,name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('My Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body:
      Container(

        child: SingleChildScrollView(

          child: Column(
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter email"
                  ),
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Enter password"
                  ),
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FlatButton(
                  onPressed: (){
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
                        .then((signedInUser){
                          UserManagement().storeNewUser(signedInUser, context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Created')));

                    }).catchError((e){
                      print(e);
                    });
                  },
                  autofocus: true,
                  clipBehavior: Clip.none,
                  child: Text('Firebase Sign up',
                    style: TextStyle(
                      color: Colors.indigo,
                      // backgroundColor: Colors.red,
                    ),),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
