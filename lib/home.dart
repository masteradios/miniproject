import 'dart:io';
import 'package:flutter/material.dart';
import 'package:miniproject/homebody1.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'reusable.dart';
import 'constants.dart';
import 'loginpage.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
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
  Text('hi'),
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

            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('asssets/aditya.jpeg'),
                  ),
                  SizedBox(width: 10.0,),
                  Text('Welcome,User!',
                    style:
                    TextStyle
                      (
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0,
                    ),),
                ],
              ),

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

