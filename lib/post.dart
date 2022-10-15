import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Screen'),
        actions: <Widget>[
          ElevatedButton(
              child: Text(
                'Log Out',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => myLogin()));
              }),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Loading');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return new ListTile(
                    title: Text(document['post_title']),
                    subtitle: Text(document['post_description']),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
