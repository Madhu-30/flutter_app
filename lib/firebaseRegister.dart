
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/newUser.dart';
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
  String name, company, age;

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
        'full_name': name, // John Doe
        'company': company, // Stokes and Sons
        'age': age // 42
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

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
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Enter full name"
                  ),
                  onChanged: (value){
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Enter company name"
                  ),
                  onChanged: (value){
                    setState(() {
                      company = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Enter age"
                  ),
                  onChanged: (value){
                    setState(() {
                      age = value;
                    });
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                  onPressed: (){
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
                        .then((signedInUser){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Authetication Done')));
                    }).catchError((e){
                      print(e);
                    });
                  },
                  autofocus: true,
                  clipBehavior: Clip.none,
                  child: Text('Register',
                    style: TextStyle(
                      color: Colors.indigo,
                      // backgroundColor: Colors.red,
                    ),),
                ),
            ),

              AddUser(name, company, age),

            ]
          ),
        ),
      ),
    );
  }
}

class AddUser extends StatelessWidget {

  final String fullName;
  final String company;
  final String age;

  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {

    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
        'full_name': fullName, 'company': company, 'age': age
      }).then((value) {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Added')));

        }).catchError((error) => print("Failed to add user: $error"));
    }

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: addUser,
          child: Text("Add User",
          style: TextStyle(color: Colors.indigo),
          ),
        ),
      );
  }
}


