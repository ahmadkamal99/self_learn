import 'package:boom_boom/add_post.dart';
import 'package:boom_boom/post.dart';
import 'package:boom_boom/welcome.dart';
import 'package:boom_boom/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class myLogin extends StatefulWidget {
  const myLogin({super.key});

  @override
  State<myLogin> createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: ListView(
        children: [
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                      "https://th.bing.com/th/id/OIP.YKlaoz94cIAdnS3_mocM4AAAAA?w=167&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Email"),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      hintText: "type your email"),
                  controller: email,
                ),
                Text("Password"),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(80))),
                        hintText: "type your password"),
                    controller: password),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return signup();
                        },
                      ));
                    },
                    child: Text("sign up")),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        var authenticationobject = FirebaseAuth.instance;
                        UserCredential myUser = await authenticationobject
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text);
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return welcome();
                          },
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("added successfully")));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("sorry there is an error")));
                      }
                    },
                    child: Text("Log in")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
