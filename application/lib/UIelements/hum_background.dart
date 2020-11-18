import 'package:flutter/material.dart';

class HumBackground extends StatelessWidget {
  HumBackground(this.humValue);
  final int humValue;

  @override
  Widget build(BuildContext context) {

    return Container(
        width: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 160,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              alignment: Alignment.bottomCenter,
              child: new Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: new Container(
                    height: humValue != null ? (160 * (humValue / 100)) : 100.0,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        shape: BoxShape.rectangle,
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  )),
            ),
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Text(
                      "Humidity",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                        fontSize: 20.0,
                      ),
                    ),
                    new Text(
                      "$humValue%",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                        fontSize: 35.0,
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
