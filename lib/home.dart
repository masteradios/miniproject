import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/chat.dart';
import 'package:miniproject/homebody1.dart';
import 'package:miniproject/messages.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'constants.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  FirebaseAuth _auth=FirebaseAuth.instance;
  User loggeduser;
  String username='adiii';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentuser();
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
 ChatScreen(),
  Text('hi again'),

];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: ListTile
                (
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('asssets/aditya.jpeg'),
                ),
              )

            ),
            SizedBox(height: 10.0,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
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
    return     Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
        ),
        SizedBox(width: 10.0,),
        GestureDetector(onTap: ()
        {
          Navigator.pushNamed(context, route);
        },
          child: Icon(icon,size: 30.0,),

        ),

      ],
    );
  }
}

