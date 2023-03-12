import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();

    final loggeduser = FirebaseAuth.instance.currentUser;
    final user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
        Navigator.popUntil(context, ModalRoute.withName('/login'));
        Navigator.pushNamed(context, '/login');
      } else {
        print('User is signed in!');
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text('App by : D7A'),
            ],
          ),
        ));
  }
}