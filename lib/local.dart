import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audio_cache.dart';

String command;
String database;

class Local extends StatefulWidget {
  @override
  _LocalState createState() => _LocalState();
}

class _LocalState extends State<Local> {
  var webdata;
  web(command) async {
    var url = "http://192.168.43.175/cgi-bin/local.py?x=${command}";
    var r = await http.get(url);
    setState(() {
      webdata = r.body;
    });
    print(webdata);
  }

  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    var database = db.collection('linuxserver').add({
      '$command': '$webdata',
    });
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.storage),
        title: Text(
          'Local Console',
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
                        web(command);
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
