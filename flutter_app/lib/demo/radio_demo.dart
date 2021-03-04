import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _selectValue = 0;

  void _handSelectChange(int value) {
    setState(() {
      _selectValue = value;
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('RadioButtonValue:  $_selectValue'),
            SizedBox(
              height: 20,
            ),
            RadioListTile(
              value: 0,
              groupValue: _selectValue,
              onChanged: _handSelectChange,
              title: Text('Object A'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_1),
              selected: _selectValue == 0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _selectValue,
              onChanged: _handSelectChange,
              title: Text('Object B'),
              subtitle: Text('History'),
              secondary: Icon(Icons.filter_2),
              selected: _selectValue == 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//                Radio(
//                    value: 0,
//                    groupValue: _selectValue,
//                    activeColor: Colors.green,
//                    onChanged: _handSelectChange),
//                Radio(
//                    value: 1,
//                    groupValue: _selectValue,
//                    activeColor: Colors.green,
//                    onChanged: _handSelectChange)
              ],
            )
          ],
        ),
      ),
    );
  }
}
