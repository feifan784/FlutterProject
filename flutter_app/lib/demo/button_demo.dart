import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flatBubbtonDemo = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
            data: Theme.of(context).copyWith(
                buttonColor: Theme.of(context).accentColor,
                buttonTheme: ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
//                shape: BeveledRectangleBorder(
//                  borderRadius: BorderRadius.circular(12)
//                )
                    shape: StadiumBorder())),
            child: RaisedButton(
              onPressed: () {},
              child: Text('FlatButton'),
              textColor: Theme.of(context).accentColor,
              splashColor: Colors.grey,
            )),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.deck),
          textColor: Theme.of(context).accentColor,
          splashColor: Colors.grey,
          label: Text('FlatButtonT'),
        ),
        OutlineButton.icon(
          onPressed: () {},
          icon: Icon(Icons.deck),
          textColor: Theme.of(context).accentColor,
          splashColor: Colors.grey,
          highlightColor: Colors.blueAccent,
          label: Text('OutlineButton'),
          borderSide: BorderSide(color: Colors.black),
          shape: StadiumBorder(),
        ),
      ],
    );

    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            textColor: Theme.of(context).accentColor,
            splashColor: Colors.grey,
            highlightColor: Colors.blueAccent,
            borderSide: BorderSide(color: Colors.black),
            shape: StadiumBorder(),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            textColor: Theme.of(context).accentColor,
            splashColor: Colors.grey,
            highlightColor: Colors.blueAccent,
            borderSide: BorderSide(color: Colors.black),
            shape: StadiumBorder(),
          ),
        ),
      ],
    );

    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
            data: Theme.of(context).copyWith(
                buttonTheme: ButtonThemeData(padding: EdgeInsets.all(50))),
            child: ButtonBar(
              children: [
                OutlineButton(
                  child: Text('Button'),
                  onPressed: () {},
                  textColor: Theme.of(context).accentColor,
                  splashColor: Colors.grey,
                  highlightColor: Colors.blueAccent,
                  borderSide: BorderSide(color: Colors.black),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                ),
                OutlineButton(
                  child: Text('Button'),
                  onPressed: () {},
                  textColor: Theme.of(context).accentColor,
                  splashColor: Colors.grey,
                  highlightColor: Colors.blueAccent,
                  borderSide: BorderSide(color: Colors.black),
                  shape: StadiumBorder(),
                )
              ],
            ))
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [flatBubbtonDemo, outlineButtonDemo, buttonBarDemo],
        ),
      ),
    );
  }
}
