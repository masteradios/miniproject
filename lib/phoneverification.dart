import 'package:flutter/material.dart';

class PhoneVerification extends StatefulWidget {
  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0, left: 6.0),
                  child: Column(
                    children: [
                      Text(
                        'You\'ll receive an automated SMS',
                        style: TextStyle(
                            fontSize: 40.0, fontFamily: 'SourceSansPro'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'We\'ll send you an automated message containing your OTP. Dont\'t worry you don\'t need to reply back.',
                              style: TextStyle(fontSize: 15.0),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200.0,
                      child: Image(
                        image: AssetImage('asssets/phone1.jpg'),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width:50.0,
                          child: TextField
                            (
                            enabled: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration
                              (
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(width: 2, color: Color(0x40524f4f)),
                                ),
                                focusedBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(width: 2, color: Colors.lightBlue),
                                )
                                ),
                              labelText: '+91',
                            ),
                          ),
                        ),
                        SizedBox(
                          width:MediaQuery.of(context).size.width-100,
                          child: TextField
                            (
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration
                              (
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(width: 2, color: Color(0x40524f4f)),
                                ),
                                focusedBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(width: 2, color: Colors.lightBlue),
                                )
                                ),
                                hintText: 'Enter your Phone number'
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        onTap: ()
                        {

                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Verify OTP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
