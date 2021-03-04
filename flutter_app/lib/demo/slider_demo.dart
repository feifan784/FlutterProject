import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  @override
  Widget build(BuildContext context) {
    double _sliderItemA = 0.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: _sliderItemA,
                  onChanged: (double value) {
                    setState(() {
                      _sliderItemA = value;
                    });
                  },
                  activeColor: Theme.of(context).accentColor,
                  inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                  min: 0.0,
                  // 设置最小值
                  max: 10,
                  divisions: 10,
                  label: '${_sliderItemA.toInt()}', // 设置最大值
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('SliderValue: ${_sliderItemA}'),
          ],
        ),
      ),
    );
  }
}
