import 'package:flutter/material.dart';
import 'package:miniproject/ashwa.dart';
import 'package:miniproject/calendar.dart';
import 'package:miniproject/lions.dart';
import 'package:miniproject/messages.dart';
import 'package:miniproject/register.dart';
import 'package:miniproject/searchproject.dart';
import 'chat.dart';
import 'home.dart';
import 'aboutpage.dart';
import 'account.dart';

import 'loginpage.dart';
import 'lions.dart';

import 'package:firebase_core/firebase_core.dart';
import 'completed projects.dart';
import 'userinfopage.dart';
import 'pragatigrp.dart';
import 'phoneverification.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( Green());
}
class Green extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/register',
      routes: {
        '/chat':(context)=>ChatScreen(),
        '/register':(context)=>RegisterPage(),
        '/home':(context)=>Home(),
        '/about':(context)=>About(),
        '/account':(context)=>AccountPage(),
        '/messages':(context)=>Messages(),
        '/calendar':(context)=>Calendar(),
        '/login':(context)=>LoginPage(),
        '/ashwa':(context)=>Ashwa(),
        '/lions':(context)=>Lions(),
        '/notfound':(context)=>Messages(),
        '/complete':(context)=>CompletedProjects(),
        '/pragati':(context)=>Pragati(),
        '/personal':(context)=>PersonalData(),
        '/phone':(context)=>PhoneVerification(),
        '/search':(context)=>Search()
      },


    );
  }
}


