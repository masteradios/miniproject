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
          'email':email,
        });

    }
    catch(e){print(e);}

  }

  void addmembers(String projectname) async
  {
    DocumentReference userRef=FirebaseFirestore.instance.collection('users').doc(email);
    DocumentReference groupRef=FirebaseFirestore.instance.collection('projects').doc(projectname);
    await groupRef.update(
        {
          'members':FieldValue.arrayUnion(['${email}']),
        });

     await userRef.update(
        {
          'groups':FieldValue.arrayUnion(['${projectname}_${email}'])
        });
  }

  Future<String> getuserNamebyid() async {
    DocumentSnapshot doc=await userRef.doc(email).get();
    print('heloooooooooooooo'+doc['username']);
    return doc['username'];

  }
}