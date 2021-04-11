import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Model.dart';

class listFollow extends StatelessWidget {
  @override

  List<Model> list= [ Model('Ankita De', 'Co Founder'),
    Model('Sourajit Basu', 'Co Founder'),
    Model('Prajata Samanta', 'Lead Developer'),
    Model('Prateek Majumder', 'Marketing Manager'),
    Model('Sarbari Chowdhury', 'Android Developer'),
    Model('Saikat Chowdhury', 'Android Developer'),
    Model('Sourajit Basu', 'UX Designer'),
    Model('Ankita De', 'Graphic Designer'),
    Model('Prajata Samanta', 'Operations Head')];

  Widget template(e){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/21.png'),
                  radius: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(e.name,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald '
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(e.designation,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15
                        ),),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('My Followers',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5,10,5,20),
          child: Column(
            children: list.map((e) => template(e)).toList(),
          ),
        ),
      ),
    ); ;
  }

}
