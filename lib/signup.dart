import 'package:boom_boom/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // var controller = TextEditingController();
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 150,
          ),
          TextField(
            controller: name,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                hintText: "type your name"),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                hintText: "type your email"),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                hintText: "type your password"),
          ),
          TextButton(
              onPressed: () async {
                var username = name.text;
                var email_addres = email;
                var Password = password;
                createUser(
                    name: name.text,
                    email: email.text,
                    password: password.text);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return myLogin();
                  },
                ));
                try {
                  var authenticationobject = FirebaseAuth.instance;

                  UserCredential myUser =
                      await authenticationobject.createUserWithEmailAndPassword(
                          email: email.text, password: password.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("added successfully")));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("sorry there is an error")));
                }
              },
              child: Text("sign up"))
        ],
      ),
    );
  }
}

Future createUser(
    {required String name,
    required String email,
    required String password}) async {
  var docUser = FirebaseFirestore.instance.collection('users').doc();
  var json = {'name': name, 'email': email, 'password': password};
  await docUser.set(json);
}
