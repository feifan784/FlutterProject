import 'package:flutter/material.dart';

enum Option { A, B, C }

class SimpleDemo extends StatefulWidget {
  @override
  _SimpleDemoState createState() => _SimpleDemoState();
}

class _SimpleDemoState extends State<SimpleDemo> {
  String _choiceValue = 'noting';

  Future _showDialog() async {
    final Option value = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: [
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
              )
            ],
          );
        });

    switch (value) {
      case Option.A:
        setState(() {
          _choiceValue = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _choiceValue = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _choiceValue = 'C';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Your Choice: $_choiceValue')],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: Icon(Icons.book),
      ),
    );
  }
}
