import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = CounterProvider.of(context).bloc;
    return Center(
      child: ActionChip(
        label: Text('0'),
        onPressed: () {
          _bloc.log('ActionClip');
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
//          _bloc.log('FloatActionButton');
          _bloc.counter.add(1);
        });
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;

  final CounterBloc bloc;

  CounterProvider({this.bloc, this.child}) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  final _counterActionControl = StreamController<int>();

  StreamSink<int> get counter => _counterActionControl.sink;

  CounterBloc() {
    _counterActionControl.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
  }

  void disponse() {
    _counterActionControl.close();
  }

  void log(String value) {
    print('$value:   bloc');
  }
}
