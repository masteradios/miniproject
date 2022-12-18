import 'package:flutter/material.dart';
class PersonalData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:Center(
          child:Column(
            children: [
              CircleAvatar(
                radius:50,
                backgroundImage: AssetImage('asssets/ww2.jpeg'),

              ),

              Text(
                'Submersive Comrade',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 27,
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),//p
              SizedBox(
                height: MediaQuery.of(context).size.height/2,
              ),// Profile name
              Text(
                'Environment Enthusiast ',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  color: Colors.teal.shade100,

                ),
              ),//flutter beginner
              Text(
                  '______________________________'
              ),
            ],
          ),
        ),


      ),


    );
  }
}
