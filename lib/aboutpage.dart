import 'package:flutter/material.dart';
class About extends StatefulWidget {

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
        body: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400.0,
          childAspectRatio: 1.5,
          crossAxisSpacing: 100.0,

        ),
          children: [
            about(' Dr. Prashant Vilas Kanade',AssetImage('asssets/kanadesir.jpg'),'Mentor'),
            about('Vedant T. : D7A 57  ',AssetImage('asssets/vedant.jpeg'),'Group Member 1'),
            about('Aditya K : D7A 37 ',AssetImage('asssets/aditya.jpeg'),'Group Member 2'),
            about('Lintomon C. : D7A 09 ',AssetImage('asssets/linto.jpeg'),'Group Member 3'),
            about('Chinmay Phapale : D7A 46 ',AssetImage('asssets/chinma.jpeg'),'Group Member 4'),





          ],
        )


    );
  }
}
class about extends StatelessWidget {
  about(this.name,this.image,this.title);
  final String name;
  final AssetImage image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: image,
          ),
          Center(child: Text(title,style: TextStyle(
              decoration:TextDecoration.underline,
              fontSize: 20.0,fontWeight: FontWeight.bold),)),
          Center(child: Text(name,style: TextStyle(
              fontSize: 20.0,fontWeight: FontWeight.bold),)),
        ],
      ),

    );
  }
}
