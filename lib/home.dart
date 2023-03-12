import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/chat.dart';
import 'package:miniproject/firebase_services.dart';
import 'package:miniproject/groups.dart';
import 'package:miniproject/homebody1.dart';
import 'package:miniproject/messages.dart';
import 'package:miniproject/searchproject.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'constants.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  FirebaseAuth _auth=FirebaseAuth.instance;
  Database database=Database(FirebaseAuth.instance.currentUser.email);
  User loggeduser;
  String username='';

  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentuser();
    getuserNamebyid();

  }
  int _index=0;
  HomeState();
  alertmethod()
  {
    Alert(
      context:context,
      title: 'Are you sure you want to exit ??',
      buttons: [
        DialogButton(child: Text('Yes'), onPressed:(){exit(0);}),
        DialogButton(child: Text('No'), onPressed:(){Navigator.pop(context);})

      ]
    ).show();

  }
  SearchBar searchBar=SearchBar();
final tabs=
[
  Body1(),
  GroupList(),
  Text('hi again'),

];
  @override
  void getcurrentuser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggeduser = user;

        print('on home page');
      }
    } catch (e)
    {

    }
  }
  void getuserNamebyid() async {
    DocumentSnapshot doc=await database.userRef.doc(loggeduser.email).get();
    print('heloooooooooooooo'+doc['username']);

    setState(() {
      username=  doc['username'];
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: ListTile
                (
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(child: Text(username,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
                ),
                title: Icon(Icons.account_circle,size: 100,),
              )

            ),
            SizedBox(height: 10.0,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    DrawerContent('Account', Icons.account_circle, '/account'),
                    DrawerContent('About Us', Icons.info, '/about'),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child:   GestureDetector(
                  onTap: ()
                  {
                    alertmethod();
                  },
                  child: Icon(Icons.settings_power,size: 50.0,),

              ),

            )


          ],
        ),
        ),
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(onTap: ()
          {

            Navigator.pushNamed(context, '/search');
          }, child: Icon(Icons.search_rounded,color: Colors.black,size: 30,))
        ],
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Planterr',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body:tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15.0,
        iconSize: 30.0,
        onTap: (index)
        {
          print(index);
          setState(()
          {
            _index=index;
          }
          );

        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'Calendar'),



        ],
      ),



    );
  }
}

class DrawerContent extends StatelessWidget {
  DrawerContent(this.title,this.icon,this.route);
  final String title;
  final IconData icon;
  final String route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()
        {
          Navigator.pushNamed(context, route);
        },
        child: ListTile
      (
      leading: Text(title,style: TextStyle(fontSize: 30,color: Colors.greenAccent),),
      trailing: Icon(icon,size: 30,color: Colors.black38,),
    ));
  }
}

