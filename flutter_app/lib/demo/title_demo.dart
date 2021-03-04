import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("课程",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
    );
  }
}
