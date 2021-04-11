
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'profile.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {

  final formkey = GlobalKey<FormState>();
  final pController = TextEditingController();
  final confirmPController = TextEditingController();

  String selectedValue = 'Male';
  String gender_groupValue = '';
  int seletedRadio;

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
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text('Enter Details',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Oswald'
                  ),),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: Form(
                  key: formkey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Enter email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: pController,
                            validator: (String password){
                              if(password.isEmpty){
                                return 'Cannot be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Enter password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: confirmPController,
                            validator: (String value){
                              if(value != pController.value.text ){
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Confirm password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                labelText: 'Enter mobile number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                        ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlatButton(
                  onPressed: (){
                    if(formkey.currentState.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Created')));

                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profile(),
                      settings: RouteSettings(
                        arguments: {}
                      )
                      )
                      );
                    }
                  },
                  color: Colors.blueGrey,
                  child: Text('Sign up',
                  style: TextStyle(color: Colors.white),),
                ),
              ) ,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlatButton(
                  onPressed: (){
                    if(formkey.currentState.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Created')));

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => profile(),
                              settings: RouteSettings(
                                  arguments: {}
                              )
                          )
                      );
                    }
                  },
                  color: Colors.blueGrey,
                  child: Text('Sign in',
                    style: TextStyle(color: Colors.white),),
                ),
              ) ,


            ]),
      ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  String dropdownValue = 'One';
  List <String> spinnerItems = [
    'One',
    'Two'
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.red, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String data) {
                setState(() {
                  dropdownValue = data;
                });
              },
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            Text('Selected Item = ' + '$dropdownValue',
                style: TextStyle
                  (fontSize: 22,
                    color: Colors.black)),

          ]),
        ),
    );
  }
}
