import 'package:flutter/material.dart';
class HomeIcon extends StatelessWidget {
  HomeIcon(this.icon,this.routename);
  final IconData icon;
  final String routename;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ()
        {if(icon==Icons.home)
        {
          Navigator.pushReplacementNamed(context, routename);
        }
          else
         { Navigator.pushNamed(context, routename);}


        },
        icon: Icon(icon,size: 35,));
  }
}
TextStyle buildTextstyle(double size) {
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize:size,
  );
}
class SearchBar {

  InputDecoration searchbar(String text)
  {
    return InputDecoration(
      hintText: text,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(width: 2, color: Color(0x40524f4f)),
      ),
      focusedBorder: (OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(width: 2, color: Color(0x40524f4f)),
      )),
    );
  }

}

class ProjectInfo extends StatelessWidget {
  ProjectInfo(this.title,this.location,this.description,this.aboutorganization,this.impactmade,this.time);
  final String title;
  final String location;
  final String description;
  final String aboutorganization;
  final String impactmade;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0x80b4eb57)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Project Name: '+title,style: TextStyle(
              fontSize: 30.0,fontWeight: FontWeight.bold,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Project Location: '+location,style: TextStyle(
                fontSize: 30.0,fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Project Description: ',style: TextStyle(
                fontSize: 30.0,fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all( 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(description,style: TextStyle(
                fontSize: 20.0,fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( top: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Commencement Date :',style: TextStyle(
                fontSize: 30.0,fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all( 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(time,style: TextStyle(
                fontSize: 20.0,fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only( top: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('About the Organization',style: TextStyle(
                fontSize: 30.0,fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all( 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(aboutorganization,style: TextStyle(
                fontSize: 20.0,fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( top: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('What Impact can You Make ??',style: TextStyle(
                fontSize: 28.0,fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all( 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(impactmade,style: TextStyle(
                fontSize: 20.0,fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
        ],
      ),



    );
  }
}
class Button extends StatelessWidget {
  Button(this.message,this.colour);
  final String message;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container    (
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration
        (
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
      ),

      child:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(message,style: TextStyle
            (
            color: Colors.white,
            fontSize: 25.0,
          ),),
        ),
      ),
    );
  }
}
