import 'package:flutter/material.dart';

class PopupMenuDemo extends StatefulWidget {
  @override
  _PopupMenuDemoState createState() => _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemo> {
  String _currentMenu = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_currentMenu),
                PopupMenuButton(
                    onSelected: (value) {
                      print(value);
                      setState(() {
                        _currentMenu = value;
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            child: Text('Home'),
                            value: 'Home',
                          ),
                          PopupMenuItem(
                            child: Text('Discover'),
                            value: 'Discover',
                          ),
                          PopupMenuItem(
                            child: Text('More'),
                            value: 'More',
                          )
                        ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
