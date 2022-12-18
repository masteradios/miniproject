import 'dart:io';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SearchBar searchBar=SearchBar();
  bool hidetext=true;
  bool showspinner=false;
  String email='';
  String errormessage='';
  final _auth=FirebaseAuth.instance;
  String password='';
  @override



  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(color: Colors.green,),
          opacity: 0.2,
          inAsyncCall: showspinner,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height/6,
                        child: Image(image: AssetImage('asssets/green.png'),fit: BoxFit.contain,),),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        onChanged: (value) {
                          email=value;
                        },
                        decoration: InputDecoration(

                          labelStyle: TextStyle(fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold),
                          hintText: 'Enter Your Email-ID',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(width: 2, color:  Colors.grey),
                          ),
                          focusedBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(width: 2, color: Colors.lightBlue),
                          )),
                        ),
                      ),
                    ),
                    SizedBox
                      (
                      child: Text(errormessage,style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.bold),),
                      height: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value)
                        {
                          password=value;
                        },
                        obscureText:hidetext,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            focusColor: Colors.black,
                            onPressed: (){
                              setState(() {
                                hidetext=!hidetext;

                              });
                            },
                            icon: Icon(hidetext?Icons.visibility_off:Icons.visibility),

                          ),


                          labelStyle: TextStyle(fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold),
                          hintText: 'Enter Your Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(width: 2, color:   Colors.grey),
                          ),
                          focusedBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(width: 2, color: Colors.lightBlue),
                          )),
                        ),
                      ),
                    ),
                TextButton(
                child:Button('Login',Colors.green),
                onPressed: () async
                {


                setState(() {
                  errormessage='';


                  showspinner=true;
                });

                try
                {
                  final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(user!=null)
                  {
                    Navigator.pushReplacementNamed(context,'/home');

                  }
                  else
                  {

                  }
                  errormessage='';
                }

                on FirebaseAuthException catch(error)
                {
                  errormessage=error.message;
                  print(errormessage);
                }
                setState(() {

                  showspinner=false;
                });

                },),
                    GestureDetector
                      (
                      onTap: ()
                      {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: Text
                        (
                        'Don\'t have an Account? Click here to Register',
                        style: TextStyle
                          (
                          color: Colors.blue,
                        ),
                      ),
                    ),



                  ],
                ),





            ),
          ),
        ),
      ),
    );
  }
}

// class LoginBar extends StatefulWidget {
//
//   @override
//   State<LoginBar> createState() => _LoginBarState();
// }
//
// class _LoginBarState extends State<LoginBar>  {
//   _LoginBarState(this.title,this.routename);
//   final String title;
//   final String routename;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ()
//       {
//         Navigator.pushReplacementNamed(context, routename);
//
//       },
//       child: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.green,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               textBaseline: TextBaseline.alphabetic,
//               children: [
//                 SizedBox(width: MediaQuery.of(context).size.width/3,),
//                 Text(title,style: TextStyle(
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.w600,
//
//                 ),),
//
//
//               ],
//             ),
//           ),
//
//
//         ),
//       ),
//     );
//   }
// }






