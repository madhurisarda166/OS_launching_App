import 'package:docker_app/container.dart';
import 'package:docker_app/terminate.dart';
import 'package:docker_app/wp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'local.dart';
import 'mysql.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'terminate.dart';

_launchURL2() async {
  const url = 'http://192.168.29.56:8080';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

var url =
    "https://raw.githubusercontent.com/aaditya2801/myflutter/master/1_j_zP74-cpvXRcs8dM_pkMQ.jpeg";

_launchURL() async {
  const url = 'https://hub.docker.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL1() async {
  const url = 'https://labs.play-with-docker.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

myapp1() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.grey);
}

myt() {
  Fluttertoast.showToast(
      msg: "This is Aaditya!! FLUTTER TASK 1 !! AUDIO & VIDEO PLAYER",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 6,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontSize: 16.0);
}

myprint() {
  print('AADITYA  !! ');
}

class MyDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Image.network(
                      'https://raw.githubusercontent.com/aaditya2801/myflutter/master/unnamed.png')),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new ListTile(
              title: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.laptop_windows), onPressed: null),
                  Text('LOCAL CMD', style: TextStyle(fontFamily: 'Lobster'))
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Local()));
              },
            ),
            new ListTile(
              title: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.laptop_windows), onPressed: null),
                  Text('Launch ', style: TextStyle(fontFamily: 'Lobster'))
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new MyWp()));
              },
            ),
            
            new ListTile(
              title: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.laptop_windows), onPressed: null),
                  Text('Terminate',
                      style: TextStyle(fontFamily: 'Lobster'))
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Terminate()));
              },
            ),
            new ListTile(
              title: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.laptop_windows), onPressed: null),
                  Text('Container Terminal',
                      style: TextStyle(fontFamily: 'Lobster'))
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Docker()));
              },
            ),
             new ListTile(
              title: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.laptop_windows), onPressed: null),
                  Text('Play with Docker',
                      style: TextStyle(fontFamily: 'Lobster'))
                ],
              ),
              onTap: (_launchURL1) ,
                // Navigator.push(context,
                //     new MaterialPageRoute(builder: (context) => _launchURL()));
              
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'AS SERVER',
          style: TextStyle(fontFamily: 'Sriracha'),
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.account_circle), onPressed: _launchURL)
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade200,
        margin: EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 200.0,
                    child: TextLiquidFill(
                      text: 'DOCKER',
                      waveColor: Colors.blueAccent,
                      boxBackgroundColor: Colors.amber,
                      textStyle: TextStyle(
                        fontFamily: 'LuckiestGuy',
                        fontSize: 29.0,
                        fontWeight: FontWeight.bold,
                      ),
                      boxHeight: 100.0,
                    ),
                  ),
                  Card(
                    color: Colors.amber,
                    child: Image.asset('assets/mydocker.gif'),
                  ),
                  SizedBox(
                    width: 250.0,
                    child: ScaleAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        totalRepeatCount: 1000,
                        text: ["By", "Kratika", "Madhuri","Shruti"],
                        textStyle: TextStyle(
                            fontSize: 50.0,
                            fontFamily: 'Satisfy',
                            color: Colors.blue),
                        textAlign: TextAlign.center,
                        alignment: AlignmentDirectional
                            .topStart // or Alignment.topLeft
                        ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
