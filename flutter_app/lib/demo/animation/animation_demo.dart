import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColor;
//  double textSize = 37 / 3;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
//      value: 37,
//      lowerBound: 37,
//      upperBound: 100,
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);

    animation = Tween(begin: 37.0, end: 100.0).animate(curve);

    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red).animate(curve);

//    animationController.addListener(() {
//      setState(() {
//        textSize = animation.value / 3;
//      });
//    });

    animationController.addStatusListener((status) {
      print(status);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: AnimationHeart(
      animations: [animation,animationColor],
      controller: animationController,
    ));
  }
}

class AnimationHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;
  double textSize = 37 / 3;

  AnimationHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '送你一朵小红花',
          style: TextStyle(
              color: Colors.red,
              fontSize: textSize,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        IconButton(
          onPressed: () {
            switch (controller.status) {
              case AnimationStatus.completed:
                controller.reverse();
                break;

              default:
                controller.forward();
                break;
            }
          },
          icon: Icon(Icons.filter_vintage),
          iconSize: animations[0].value,
          color: animations[1].value,
        )
      ],
    );
  }
}
