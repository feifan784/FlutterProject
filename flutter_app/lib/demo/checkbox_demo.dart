import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              value: _isCheck,
              onChanged: (value) {
                setState(() {
                  _isCheck = value;
                });
              },
              title: Text('CheckBox Item'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.book),
              selected: _isCheck,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//                Checkbox(
//                  value: _isCheck,
//                  onChanged: (value) {
//                    setState(() {
//                      _isCheck = value;
//                    });
//                  },
//                  activeColor: Colors.green,
//                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
