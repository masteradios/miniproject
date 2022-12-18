import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  SearchBar searchBar=SearchBar();
  bool hidetext=true;
  String text;
  String email;
  String password;
  bool showspinner=false;
  final _auth= FirebaseAuth.instance;
  @override



  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall:showspinner,
          progressIndicator: CircularProgressIndicator(color: Colors.green,),
          opacity: 0.2,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.height/6,
                          child: Image(image: AssetImage('asssets/green.png'),fit: BoxFit.contain,),),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value)
                          {
                              email=value;
                              print(email);
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold),
                            hintText: 'Enter Your Email-ID',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(width: 2, color: Colors.grey),
                            ),
                            focusedBorder: (OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(width: 2, color: Colors.lightBlue),
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value)
                          {
                              password=value;

                          },
                          obscureText:hidetext,
                          decoration: InputDecoration(
                            helperText: 'Minimum length is 6 ',
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
                              borderSide: BorderSide(width: 2, color:  Colors.grey),
                            ),
                            focusedBorder: (OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(width: 2, color: Colors.lightBlue),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(onPressed: ()async
                  {
                    setState(() {
                      showspinner=true;
                    });
                    try
                    {
                      final newuser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(newuser!=null)
                      {
                        Navigator.pushReplacementNamed(context, '/home');

                      }

                    }catch(e) {
                     print(e);
                    }
                    setState(() {
                      showspinner=false;
                    });




                  }, child: Button('Register',Colors.green)
                  ),
                  GestureDetector
                    (
                    onTap: ()
                    {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text
                      (
                      'Already have an Account? Click here to Login',
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






