import 'dart:io';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'reusable.dart';
class Lions extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    alertmethod()
    {
      Alert(
          context:context,
          title: 'Donation Succsesful!!',
          image: Image.asset('asssets/check.png'),
          buttons: [
            DialogButton(child: Text('Go Back'), onPressed: (){Navigator.pop(context);})
          ]
      ).show();

    }
    alertmethodvolunteer()
    {
      Alert(
          context:context,
          title: 'Volunteering Succsesful!!',
          image: Image.asset('asssets/check.png'),
          buttons: [
            DialogButton(child: Text('Go Back'), onPressed: (){Navigator.pop(context);})
          ]
      ).show();

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
            child:ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ReusableCard('Leone Club', AssetImage('asssets/plant2.jpg'), 'Make Kalyan Green!!', '/ashwa'),
                ),
                ProjectInfo('Leone Club','Kalyan','We aim at planting 100 Neem trees in a period of 1.5 months.We sincerely request you to donate money or volunteer for this noble cause.Even a single penny is welcomed.','Leone Club transforms your gifts into service projects that change lives both close to home and around the world.','1) Planting a tree helps in improving air quality by filtering harmful dust and pollutants\n\n2) Work with small-holder farmers to create sustainable Agroforests\n\n3) Protect homes of various bieds,insects and animals ','17 November 2022'),
              ],
            ) ,
          ),
          TextButton(onPressed: (){alertmethod();}, child: Impact('Donate'),),
          Text('OR',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
          TextButton(onPressed: (){alertmethodvolunteer();}, child: Impact('Volunteer'),),
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
            child: Text(title,style: TextStyle(
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



// GridView(
// gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
// maxCrossAxisExtent: 400,
// crossAxisSpacing: 10.0,
// mainAxisSpacing: 10.0,
// ),
// children: [
// ReusableCard(
// 'Ashwa Green',
// AssetImage('asssets/plant.jpg'),
// 'Make Mulund Green!!',
// '/ashwa'
// ),
// ProjectInfo('Ashwa Group'),
//
// ],
// )
