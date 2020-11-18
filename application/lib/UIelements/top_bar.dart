import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(1, 2),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome to",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                    fontSize: 35.0,
                  ),
                ),
                Text("homeIoT",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w300,
                    color:Colors.black87,
                    fontSize: 35.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 143.0,
              width: 193.0,
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/images/undraw_visual_data_b1wx.png'),
                  fit: BoxFit.fill,  
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
