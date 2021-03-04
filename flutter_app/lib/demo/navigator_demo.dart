import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed: null, child: Text('Home')),
            FlatButton(
                onPressed: () => {
                      Navigator.pushNamed(context, '/about')
//                      Navigator.of(context).push(MaterialPageRoute(
//                          builder: (BuildContext context) =>
//                              Page(title: 'About')))
                    },
                child: Text('About')),
          ],
        ),
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final String title;

  Pages({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
