import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miniproject/firebase_services.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'reusable.dart';

class Ashwa extends StatefulWidget {
  @override
  State<Ashwa> createState() => _AshwaState();
}

class _AshwaState extends State<Ashwa> {
  User loggeduser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    alertmethod() {
      Alert(
          context: context,
          title: 'Donation Successful!!',
          image: Image.asset('asssets/check.png'),
          buttons: [
            DialogButton(
                child: Text('Go Back'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ]).show();
    }

    alertmethodvolunteer() {
      Alert(
          context: context,
          title: 'Volunteering Successful!!',
          image: Image.asset('asssets/check.png'),
          buttons: [
            DialogButton(
              child: Text('Go Back'),
              onPressed: () async {
                Navigator.pop(context);
              },
            )
          ]).show();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Planterr',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ReusableCard(
                      'Ashwa Green',
                      AssetImage('asssets/plant.jpg'),
                      'Make Mulund Green!!',
                      '/ashwa'),
                ),
                ProjectInfo(
                    'Ashwa Green',
                    'Mulund',
                    'We aim at planting 100 mustard trees in a period of 1 month.We sincerely request you to donate money or volunteer for this noble cause.Even a single penny is welcomed.',
                    'Ashwa Green transforms your gifts into service projects that change lives both close to home and around the world.',
                    '1) Restore watersheds, mountainsides, and coastlines across India\n\n2) Work with small-holder farmers to create sustainable Agroforests\n\n3) Protect coastlines from erosion by planting native mangroves ',
                    '13 November 2022'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {

              alertmethod();
            },
            child: Impact('Donate'),
          ),
          Text(
            'OR',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              Database database = Database(loggeduser.email);
              database.addmembers('ashwa');
              alertmethodvolunteer();
            },
            child: Impact('Volunteer'),
          ),
        ],
      ),
    );
  }
}

class Impact extends StatelessWidget {
  Impact(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}