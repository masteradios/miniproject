import 'package:flutter/material.dart';
import 'package:miniproject/ashwa.dart';
import 'package:miniproject/calendar.dart';
import 'package:miniproject/imageinput.dart';
import 'package:miniproject/lions.dart';
import 'package:miniproject/messages.dart';
import 'package:miniproject/register.dart';
import 'package:miniproject/searchproject.dart';
import 'package:miniproject/welcome.dart';
import 'chat.dart';
import 'groupchat.dart';
import 'groupchatpragati.dart';
import 'home.dart';
import 'aboutpage.dart';
import 'account.dart';
import 'loginpage.dart';
import 'lions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'completed projects.dart';
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
      initialRoute: '/welcome',
      routes: {
        '/welcome':(context)=>Welcome(),
        '/imageinput':(context)=>ImageInput(),
        '/chats':(context)=>ChatScreen1(),
        '/chatspragati':(context)=>ChatScreen2(),
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
        '/phone':(context)=>PhoneVerification(),
        '/search':(context)=>Search()
      },


    );
  }
}


