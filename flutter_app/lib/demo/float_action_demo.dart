import 'package:flutter/material.dart';

class FloationActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0,
      backgroundColor: Colors.black,
//      shape: BeveledRectangleBorder(
//        borderRadius: BorderRadius.circular(30),
//      ),
    );

    Widget _floatingActionButtonExtend = FloatingActionButton.extended(
      onPressed: () {},
      label: Text('add'),
      icon: Icon(Icons.add),
      backgroundColor: Colors.black45,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloationActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
