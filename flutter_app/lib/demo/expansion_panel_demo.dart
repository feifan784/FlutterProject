import 'package:flutter/material.dart';

class ExpansionPanelItem {
  String headerTitle;
  Widget body;
  bool isExpanded;

  ExpansionPanelItem({this.headerTitle, this.body, this.isExpanded});
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();

    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerTitle: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Text('Content for Panel A'),
          width: double.infinity,
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerTitle: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Text('Content for Panel B'),
          width: double.infinity,
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerTitle: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Text('Content for Panel C'),
          width: double.infinity,
        ),
        isExpanded: false,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpended) {
                setState(() {
                  _expansionPanelItems[panelIndex].isExpanded = !isExpended;
                });
              },
              children: _expansionPanelItems.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpand) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          item.headerTitle,
                          style: Theme.of(context).textTheme.title,
                        ),
                      );
                    },
                    body: item.body,
                    isExpanded: item.isExpanded);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
