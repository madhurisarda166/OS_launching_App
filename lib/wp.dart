import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audio_cache.dart';

web(osname, imagename) async {
  var url = "http://192.168.43.175/cgi-bin/final.py?x=${osname}&y=${imagename}";
  var r = await http.get(url);
  print(r.body);
}

myt2() {
  Fluttertoast.showToast(
      msg: "Container Launched",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 6,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

String osname;
String imagename;

class MyWp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.laptop_chromebook),
        title: Text(
          'Launch Container',
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
                      imagename = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(
                      height: 1,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Image Name',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                // Card(
                //   child: TextField(
                //     onChanged: (val) {
                //       imagename = val;
                //     },
                //     autocorrect: false,
                //     cursorColor: Colors.blue,
                //     style: TextStyle(height: 1),
                //     decoration: InputDecoration(
                //       icon: Icon(
                //         Icons.supervised_user_circle,
                //         color: Colors.blue,
                //       ),
                //       hintText: 'Enter Image Name ',
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.red)),
                //     ),
                //   ),
                // ),

                Card(
                  color: Colors.black,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: Colors.black,
                      onPressed: () {
                        final play = AudioCache();
                        play.play('webcont.mp3');
                        myt2();
                        web(
                          osname,
                          imagename,
                        );
                      },
                      child: Icon(
                        Icons.settings_power,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
