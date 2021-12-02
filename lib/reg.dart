import 'package:docker_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/doc1.jpeg')),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 400,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      hintText: 'Enter EmailID ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      hintText: 'Enter Password ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    child: MaterialButton(
                      minWidth: 200,
                      height: 40,
                      child: Text('Submit'),
                      onPressed: () async {
                        try {
                          var user = await authc.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          print(email);
                          print(password);
                          print(user);

                          if (user.additionalUserInfo.isNewUser == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLogin()));
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
