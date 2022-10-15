import 'package:boom_boom/login.dart';
import 'package:boom_boom/post.dart';
import 'package:flutter/material.dart';

import 'add_post.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return myLogin();
                  },
                ));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AddPost();
                    },
                  ));
                },
                child: Text("Add post")),
            SizedBox(
              width: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PostsScreen();
                    },
                  ));
                },
                child: Text("view post"))
          ],
        ),
      ),
    );
  }
}
