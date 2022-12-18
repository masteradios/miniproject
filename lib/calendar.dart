import 'package:flutter/material.dart';
class Calendar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Planterr',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Icon(Icons.warning,size: 50.0,),
            Text('PAGE UNDER CONSTRUCTION!!'),
          ],
        ),
      ),
    );
  }
}