import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/reusable.dart';
import 'constants.dart';
import 'reusable.dart';

class AccountPage extends StatefulWidget {

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _auth=FirebaseAuth.instance;
  _AccountPageState();
  alertmethod()
  {
    Alert(
      context: context,

        title: 'Are you sure you want to logout ??',
        buttons: [
          DialogButton(
            child: Text('Yes'),
            onPressed:()
            {
              setState(() {

              });
              try
              {
                _auth.signOut();
                Navigator.pushReplacementNamed(context,'/login');
              }catch(e){}
            },
          ),
          DialogButton(child: Text('No'), onPressed:(){Navigator.pop(context);})

        ]
    ).show();

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton
          (
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),

        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Planterr',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AccountBar('Personal Information', Icons.manage_accounts_outlined,'/personal'),
                    AccountBar('Login and Password', Icons.key, '/notfound'),
                    GestureDetector(
                      onTap: ()
                      {
                        alertmethod();

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Icon(Icons.door_back_door_outlined,size: 40.0,),
                              SizedBox(width: 5.0,),
                              Text('Log Out',style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,

                              ),),

                            ],
                          ),
                        ),


                      ),
                    ),
                  ],),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeIcon(Icons.home,'/home'),



                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
class AccountBar extends StatelessWidget {
  AccountBar(this.title,this.icon,this.routename);
final String title;
final String routename;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, routename);

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            textBaseline: TextBaseline.alphabetic,
            children: [
              Icon(icon,size: 40.0,),
              SizedBox(width: 5.0,),
              Text(title,style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,

              ),),

            ],
          ),
        ),


      ),
    );
  }
}

