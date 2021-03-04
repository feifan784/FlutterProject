import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("今天天气有点冷",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 42.9,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange)),
    );
  }
}
