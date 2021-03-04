import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textSubject;

  @override
  void initState() {
    super.initState();
//    Observable<String> _observable =
//  Observable

//    PublishSubject<String> _subject = PublishSubject<String>();
//    BehaviorSubject<String> _subject = BehaviorSubject<String>();
//    ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);
//
//    _subject.add("1----------xufeifan");
//    _subject.add("2----------tenglinlin");
//    _subject.add("3----------hi");
//    _subject.listen((value) {
//      print(value);
//    });
//    _subject.listen((value) {
//      print(value.toUpperCase());
//    });
//
//    _subject.close();

    _textSubject = PublishSubject();

    _textSubject
//        .map((event) => 'item:  $event')
//        .where((event) => event.length > 20)
        .debounceTime(Duration(milliseconds: 500))
        .listen((value) {
      print(value);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.black),
      child: TextField(
        onChanged: (value) {
          _textSubject.add('onChange:  $value');
        },
        onSubmitted: (value) {
          _textSubject.add('onSubmit:  $value');
        },
        decoration: InputDecoration(labelText: 'title', filled: true),
      ),
    );
  }
}
