import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audio_cache.dart';

String command;
String database;
String osname;

class Docker extends StatefulWidget {
  @override
  _DockerState createState() => _DockerState();
}

class _DockerState extends State<Docker> {
  var webdata;
  web(command, osname) async {
    var url =
        "http://192.168.43.175/cgi-bin/dterminal.py?x=${osname}&y=${command}";
    var r = await http.get(url);
    setState(() {
      webdata = r.body;
    });
    print(webdata);
  }

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    var database = db.collection('linuxserver').add({
      '$command': '$webdata',
    });
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.storage),
        title: Text(
          'Container Console',
          style: TextStyle(fontFamily: 'Satisfy'),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  child: Card(
                    color: Colors.orange,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(00),
                            bottomRight: Radius.circular(00),
                            topRight: Radius.circular(50)),
                        side: BorderSide(width: 2, color: Colors.red)),
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (val) {
                        command = val;
                      },
                      autocorrect: false,
                      cursorColor: Colors.blue,
                      style: TextStyle(
                        height: 1,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Linux Command',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Card(
                    color: Colors.orange,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(00),
                            bottomRight: Radius.circular(00),
                            topRight: Radius.circular(50)),
                        side: BorderSide(width: 2, color: Colors.red)),
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (val) {
                        osname = val;
                      },
                      autocorrect: false,
                      cursorColor: Colors.blue,
                      style: TextStyle(
                        height: 1,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter OS Name',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                // Card(
                //   child: TextField(
                //     onChanged: (val) {
                //       osname = val;
                //     },
                //     autocorrect: false,
                //     cursorColor: Colors.blue,
                //     style: TextStyle(height: 1),
                //     decoration: InputDecoration(
                //       icon: Icon(
                //         Icons.person,
                //         color: Colors.blue,
                //       ),
                //       hintText: 'Enter OS Name ',
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.red)),
                //     ),
                //   ),
                // ),
                Card(
                  color: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      side: BorderSide(width: 0, color: Colors.black)),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: Colors.black,
                      onPressed: () {
                        final play = AudioCache();
                        play.play('checkkk.mp3');
                        web(command, osname);
                        database;
                        print('hello');
                        print(webdata);
                      },
                      child: Icon(
                        Icons.settings_power,
                        color: Colors.white,
                      )),
                ),
                Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.black,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(00),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(00)),
                          side: BorderSide(width: 2, color: Colors.red)),
                      child: Text(
                        webdata ??
                            "                       WELCOME TO CONSOLE...",
                        style: TextStyle(
                            height: 3,
                            color: Colors.white,
                            fontFamily: 'Sriracha'),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
