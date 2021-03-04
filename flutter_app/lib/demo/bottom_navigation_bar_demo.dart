import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  int _currentIndex = 0;

  BottomNavigationBarDemo(int index) {
    _currentIndex = index;
  }

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarDemoState(_currentIndex);
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  _BottomNavigationBarDemoState(int index) {
    _currentIndex = index;
  }

  int _currentIndex = 0;

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
      debugPrint(index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), title: Text('Explore')),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text('History')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('List')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My')),
        ]);
  }
}
