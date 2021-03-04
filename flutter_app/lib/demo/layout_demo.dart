import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: 100, maxWidth: 100),
            child: Container(
              color: Colors.deepPurpleAccent,
            ),
          )
        ],
      ),
    );
  }
}

class AspectRadioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 1,
        child: Container(
          color: Colors.deepPurpleAccent,
        ));
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        SizedBox(
          width: 150,
          height: 250,
          child: Container(
            alignment: Alignment(-1.0, -1.0),
//              alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1),
//                      borderRadius: BorderRadius.circular(8.0)
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(7, 102, 25, 1.0),
                  Color.fromRGBO(3, 54, 255, 1.0)
                ])),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
            right: 10.0,
            bottom: 10,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ))
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 5, 255, 0.8),
    );
  }
}
