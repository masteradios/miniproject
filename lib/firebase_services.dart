import 'package:cloud_firestore/cloud_firestore.dart';

class Database
{

  String email;
  Database(this.email);
  CollectionReference userRef=FirebaseFirestore.instance.collection('users');
  void adduserdetails(String username) async
  {
    try
    {userRef.doc(email).set(
        {
          'username':username,
          'email':email
        });

    }
    catch(e){print(e);}

  }

  Future getuserNamebyid() async {
    DocumentSnapshot doc=await userRef.doc(email).get();
    print('hiiiiiiiiiiiiiiiiiiiiii+no'+doc.data().toString());
    print('heloooooooooooooo'+doc['username']);
    return doc['username'];

  }
}