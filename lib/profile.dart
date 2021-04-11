import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listFollow.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {

  int counter_followers = 1;
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('My Profile',
            style: TextStyle(
                color: Colors.white
            ),),
          backgroundColor: Colors.blueGrey,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
          child:
          SingleChildScrollView(

            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                profileHeader(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('$counter_followers',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontFamily: 'Oswald',
                          ),
                        ),
                        Text('Followers',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('100',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontFamily: 'Oswald',
                          ),
                        ),
                        Text('Following',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('60',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontFamily: 'Oswald',
                          ),
                        ),
                        Text('Posts',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    OutlinedButton(
                      style: ButtonStyle(
                      ),
                      onPressed: (){
                        setState(() {
                          counter_followers+=1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text('Follow',
                          style: TextStyle(
                            color: Colors.indigo,
                            // backgroundColor: Colors.red,
                          ),),
                      ),
                      autofocus: false,
                      clipBehavior: Clip.none,
                    ),
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>listFollow()));
                      },
                      color: Colors.blueGrey[200],
                      autofocus: true,
                      clipBehavior: Clip.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      child: Text('See Followers',
                        style: TextStyle(
                          color: Colors.indigo,
                          // backgroundColor: Colors.red,
                        ),),
                    )
                  ],
                ),//Buttons

                profileContact(),

                Divider(
                  height: 50,
                  color: Colors.grey,
                ),

                profilePosts(),

              ]),
          ),
        ),
    );
  }
}

class profileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: CircleAvatar(
                  backgroundImage: AssetImage('assets/21.png'),
              radius: 50,
              ),
          ),
          Divider(
          height: 30,
          color: Colors.white,
          ),
          Text('Madhurima Mukherjee',
          style: TextStyle(
          // color: Colors.indigo,
          fontSize: 20,
          fontFamily: 'Oswald',
          ),
          ),//Name
          SizedBox(height:5 ),
          Text('Be yourself',
          style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 16,
          fontFamily: 'Oswald',
          ),
          ),
    ]);
  }
}

class profileContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: [
        SizedBox(height: 20,),
        Row(children: <Widget>[
          Icon(
            Icons.mail_rounded,
            color: Colors.blueGrey,
          ),
          SizedBox(width: 10),
          Text('applex03.ankita@gmail.com')
        ],),//Email
        SizedBox(height: 10,),
        Row(children: <Widget>[
          Icon(
            Icons.call,
            color: Colors.blueGrey,
          ),
          SizedBox(width: 10),
          Text('6282529037')
        ],),
      ],
    );

  }
}

class profilePosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Posts',
          style : TextStyle(
            color: Colors.indigo,
            fontSize: 20,
            fontFamily: 'Oswald',
          ),
        ),
        SizedBox(
          height: 400,

          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (index)  {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image(
                    width: 100,
                    height: 100,
                    image: NetworkImage('https://i.pinimg.com/originals/a4/30/bc/a430bcb9f931a2a7bcc7dd64ecfbb6a0.jpg'),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Colors.blueGrey
                      )
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}




