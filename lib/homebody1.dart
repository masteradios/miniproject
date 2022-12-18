import 'package:flutter/material.dart';
import 'dart:io';
import 'reusable.dart';
import 'constants.dart';
import 'loginpage.dart';
class Body1 extends StatefulWidget {

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  SearchBar searchBar=SearchBar();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onTap: () {

            },
            decoration:searchBar.searchbar('Search for projects'),
          ),
        ),
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 100.0,
                child: Image(image: AssetImage('asssets/ves.jpg'),fit: BoxFit.fill,)),
            Center(child: Text('V.E.S initiative: ICT to improve Life On Land', style: TextStyle(
              fontSize: 15.0,fontWeight: FontWeight.w900,
            ))),
          ],
        )),
        SizedBox(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  Align(
                      alignment:Alignment.bottomLeft,
                      child: Text('Current Projects',style: TextStyle(color: Colors.greenAccent,fontSize: 30.0,fontWeight: FontWeight.bold),)),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        semanticChildCount: 3,
                        children: [
                          ReusableCard('Ashwa Green', AssetImage('asssets/plant.jpg'), 'Make Mulund Green!!', '/ashwa'),
                          SizedBox(width: 5),
                          ReusableCard('Leone Club', AssetImage('asssets/plant2.jpg'), 'Make Kalyan Green!!', '/lions',),
                          SizedBox(width: 5),
                          ReusableCard('Pragati Group', AssetImage('asssets/plant3.jpg'), 'Make Delhi Green', '/pragati'),
                          SizedBox(width: 5),
                          //

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Align(
                        alignment:Alignment.bottomLeft,
                        child: Text('Completed Projects',style: TextStyle(color: Colors.greenAccent,fontSize: 30.0,fontWeight: FontWeight.bold),)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        semanticChildCount: 3,
                        children: [
                          ReusableCard('Rotery Club', AssetImage('asssets/plant4.jpg'), 'Noida Project', '/complete'),
                          SizedBox(width: 5),
                          ReusableCard('St.Xavier\'s Club', AssetImage('asssets/plant5.jpg'), ' Raipur Project', '/complete',),
                          SizedBox(width: 5),
                          ReusableCard('Newton Group', AssetImage('asssets/plant6.jpg'), 'Amravati Project', '/complete'),
                          SizedBox(width: 5),
                          ReusableCard('Drishti Group', AssetImage('asssets/plant7.jpg'), 'Nagpur Project', '/complete'),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),],),


    );
  }
}
