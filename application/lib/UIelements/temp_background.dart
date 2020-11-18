import 'package:flutter/material.dart';
import 'dart:math' as math;

class TempBackground extends StatelessWidget {
  TempBackground(this.tempValue, this.sizeFactor, this.text);
  final int tempValue;
  final double sizeFactor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240 * this.sizeFactor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150.0 * this.sizeFactor,
              height: 150.0 * this.sizeFactor,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(2, 2),
                  )
                ],
                gradient: SweepGradient(
                  center: FractionalOffset.center,
                  startAngle: 0.0,
                  endAngle: math.pi * 2,
                  colors: const <Color>[Colors.blue, Colors.yellow, Colors.red],
                  stops: const <double>[0.2, 0.5, 0.75],
                  transform: GradientRotation(math.pi / 2),
                ),
              ),
              child: new Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: new Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: new Text(
                      "$tempValue°C",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                        fontSize: 45.0 * this.sizeFactor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              this.text,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w300,
                color: Colors.white70,
                fontSize: 32.0 * this.sizeFactor,
              ),
            )
          ],
        )
      );
  }
}
