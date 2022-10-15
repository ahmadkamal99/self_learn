import 'package:boom_boom/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController _post_title = TextEditingController();

  TextEditingController _post_description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add post"),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return myLogin();
                  },
                ));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            child: Column(
          children: [
            TextField(
              controller: _post_title,
              decoration: InputDecoration(hintText: "post title"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              controller: _post_description,
              decoration: InputDecoration(hintText: "description"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var current_user = await FirebaseAuth.instance.currentUser!;
                  FirebaseFirestore.instance.collection("posts").doc().set({
                    'post_title': _post_title.text,
                    'post_description': _post_description.text,
                    'user': {
                      'uid': current_user.uid,
                      'email': current_user.email,
                    }
                  });
                },
                child: Text("add post")),
            ElevatedButton(
                onPressed: () async {
                  final FirebaseFirestore _firestore =
                      FirebaseFirestore.instance;
                  final CollectionReference _mainCollection =
                      _firestore.collection('posts');

                  DocumentReference DR = _mainCollection
                      .doc('JlCwKTVXN5RRMWdlApY9')
                      .collection('posts')
                      .doc('JlCwKTVXN5RRMWdlApY9');
                  await DR
                      .delete()
                      .whenComplete(
                          () => print('Note item deleted from the database'))
                      .catchError((e) => print(e));
                },
                child: Text("Delete post"))
          ],
        )),
      ),
    );
  }
}
