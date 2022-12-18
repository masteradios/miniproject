import 'package:flutter/material.dart';
import 'constants.dart';
class ReusableCard extends StatelessWidget {
ReusableCard(this.title,this.image,this.message,this.route);
final String title;
final AssetImage image;
final String message;
final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, route);
      },

      child: Container(
        width: MediaQuery.of(context).size.width/(3/2),
       height:MediaQuery.of(context).size.height/4 ,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: Colors.lightGreen,
         image: DecorationImage(
             fit: BoxFit.cover,
             colorFilter:ColorFilter.mode(Colors.black.withOpacity(0.4),
                 BlendMode.dstATop) ,
             image: image),
       ),


            child: Column(
              children: [
                Expanded(child: SizedBox(height: MediaQuery.of(context).size.height,)),
                Align(
                    alignment:Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(title,style: buildTextstyle(30.0),),
                )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(message,style: buildTextstyle(20.0),),
                    )),
              ],
            ),



      ),
    );
  }
}

