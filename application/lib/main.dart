import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homeiot/UIelements/hum_background.dart';
import 'package:homeiot/UIelements/top_bar.dart';
import 'package:homeiot/UIelements/temp_background.dart';
import 'package:homeiot/Database/database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeIoT',
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
  int temp;
  int hum;
  int max;

  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(days: 7), (Timer t) => pushMax(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    updateTemp();
    updateHum();
    updateMax();

    return MaterialApp(
        home: SafeArea(
      child: new Scaffold(
        backgroundColor: Color(0xFF484848),
        body: Stack(
          children: <Widget>[
            TopBar(),
            Center(
                child: TempBackground(this.temp, 1.0, 'Current temperature')),
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

  void updateTemp() {
    getTemp().then((value) => {
          this.setState(() {
            this.temp = value;
          })
        });

    if (this.temp != null && this.max != null) {
      if (this.temp > this.max) {
        pushMax(this.temp);
      }
    }
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
}
