import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audio_cache.dart';
import 'local.dart';
import 'package:docker_app/wp.dart';

web(osname) async {
  var url = "http://192.168.43.175/cgi-bin/terminate.py?x=${osname}";
  var r = await http.get(url);
  print(r.body);
}

myt2() {
  Fluttertoast.showToast(
      msg: "Container Terminated",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 6,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

String osname;

class Terminate extends StatefulWidget {
  @override
  _TerminateState createState() => _TerminateState();
}

class _TerminateState extends State<Terminate> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.laptop_chromebook),
        title: Text(
          'Terminate Container',
          style: TextStyle(fontFamily: 'Satisfy'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child: Column(
              children: [
                Card(
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
                Card(
                  color: Colors.black,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: Colors.black,
                      onPressed: () {
                        // final play = AudioCache();
                        // play.play('webcont.mp3');
                        myt2();
                        web(osname);
                      },
                      child: Icon(
                        Icons.settings_power,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
