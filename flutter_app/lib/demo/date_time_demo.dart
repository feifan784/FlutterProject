import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime _selectTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay(hour: 9, minute: 50);

  Future<void> _seleteDate() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: _selectTime,
        firstDate: DateTime(1970),
        lastDate: DateTime(2100));

    if (date == null) {
      return;
    } else {
      setState(() {
        _selectTime = date;
      });
    }
  }

  Future<void> _seleteTime() async {
    final TimeOfDay time =
        await showTimePicker(context: context, initialTime: timeOfDay);

    if (time == null) {
      return;
    } else {
      setState(() {
        timeOfDay = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _seleteDate,
                  child: Row(
                    children: [
                      Text(DateFormat.yMMMd().format(_selectTime)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                InkWell(
                  onTap: _seleteTime,
                  child: Row(
                    children: [
                      Text(timeOfDay.format(context)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
