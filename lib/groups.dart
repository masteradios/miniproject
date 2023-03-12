import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class GroupList extends StatefulWidget {
  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      getcurrentuser();
  }
  User loggeduser;
  void getcurrentuser()
  {
    final user=FirebaseAuth.instance.currentUser;
    if(user!=null)
    {
      loggeduser=user;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showgroups(loggeduser.email),
    );
  }
}

StreamBuilder showgroups(String uid) {
  String takegroupid(String res) {
    return res.substring(0, res.indexOf('_'));
  }

  String getgroupname(String res) {
    return res.substring(res.indexOf('_') + 1);
  }

  return StreamBuilder<DocumentSnapshot>(
    stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data.data() as Map<String, dynamic>;
        if (data['groups'].length == 0) {
          return noGroup();
        } else {
          return ListView.builder(
            itemCount: data['groups'].length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GroupTile(
                    takegroupid(data['groups'].toList()[index].toString())),
              );
            },
          );
        }
      } else {
        return CircularProgressIndicator(
          color: Colors.blueAccent,
        );
      }
    },
  );
}
noGroup() {
  return Container(
    child: Center(
        child: Text(
          'You don\'t have any groups created.Create new groups',
          style: TextStyle(fontSize: 15, color: Colors.black),
        )),
  );
}

class GroupTile extends StatefulWidget {
  final groupname;
  GroupTile(this.groupname);
  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if(widget.groupname=='ashwa')
          {
            Navigator.pushNamed(context, '/chats');
          }
            else
            {
              Navigator.pushNamed(context, '/chatspragati');
            }

        },
        child: ListTile(
          leading: ClipOval(
              child: Image.asset(
              'asssets/groupicon.jpg',
                fit: BoxFit.cover,
              )),
          title: Text(widget.groupname),
        ));
  }
}