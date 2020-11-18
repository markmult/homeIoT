import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homeiot/UIelements/hum_background.dart';
import 'package:homeiot/UIelements/top_bar.dart';
import 'package:homeiot/UIelements/temp_background.dart';
import 'package:homeiot/UIelements/database.dart';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dialogBackgroundColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'HomeIoT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer timer;
  int temp;
  int hum;
  int max;

  void updateTemp() {
    getTemp().then((value) => {
          this.setState(() {
            this.temp = value;
          })
        });
  }

  void updateHum() {
    getHum().then((value) => {
          this.setState(() {
            this.hum = value;
          })
        });
  }

  void updateMax() {
    getMax().then((value) => {
          this.setState(() {
            this.max = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: new Scaffold(
        backgroundColor: Color(0xFF484848),
        body: Stack(
          children: <Widget>[
            TopBar(),
            Container(
              alignment: Alignment(1.0, -0.35),
              child: RaisedButton(
                color: Color(0xFF6C63FF),
                onPressed: () {
                  updateTemp();
                  updateHum();
                  updateMax();

                  if (this.temp > this.max) {
                    pushMax(this.temp);
                  }

                  log("Temperature: $temp");
                  log("Humidity: $hum");
                },
                shape: CircleBorder(),
                child: Icon(
                  Icons.refresh_rounded,
                  size: 60.0,
                  color: Colors.white,
                ),
              ),
            ),
            Center(child: TempBackground(this.temp, 1.0, 'Current temp')),
            Align(
              alignment: Alignment(0, 0.95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TempBackground(this.max, 0.75, 'Max temp'),
                  HumBackground(this.hum),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
