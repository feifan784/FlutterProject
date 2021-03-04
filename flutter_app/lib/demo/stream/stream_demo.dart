import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;

  StreamController<String> _streamDemo;

  StreamSink _streamSink;

  String _data = 'wait for data...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('Create a Stream.');
    //创建网络数据流
//    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
//    _streamDemo = StreamController<String>();
    _streamDemo = StreamController.broadcast();
    _streamSink = _streamDemo.sink;

    print('start to listen.');
    //监听网络回调数据
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    //第二次订阅
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
  }

  void onData(event) {
    setState(() {
      _data = event;
    });
    print(event);
  }

  void onDataTwo(event) {
    print('onDataTwo:  $event');
  }

  void onError(error) {
    print('Error: ${error}');
  }

  void onDone() {
    print('Done');
  }

  //模拟网络请求过程和返回结果
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));

    return 'xufeifan';
//    throw ('Network error!');
  }

  Future<void> _addStream() async {
    print('Add a stream data.');

    String data = await fetchData();
//    _streamDemo.add(data);
    _streamSink.add(data);
  }

  void _pauseStream() {
    print('pause Stream');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('resume Stream');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('cancel Stream');
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
//        Text(_data),
        StreamBuilder(
            stream: _streamDemo.stream,
            initialData: 'wait for data again...',
            builder: (context, snapShoot) {
              return Text('${snapShoot.data}');
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed: _addStream, child: Text('Add')),
            FlatButton(onPressed: _pauseStream, child: Text('Pause')),
            FlatButton(onPressed: _resumeStream, child: Text('Resume')),
            FlatButton(onPressed: _cancelStream, child: Text('Cancel')),
          ],
        )
      ],
    );
  }
}
