import 'package:flutter/material.dart';

class ClipDemo extends StatefulWidget {
  @override
  _ClipDemoState createState() => _ClipDemoState();
}

class _ClipDemoState extends State<ClipDemo> {
  List<String> _tags;
  String _checked = 'nothing';
  List<String> _selects = [];
  String _select = 'Apple';

  @override
  void initState() {
    super.initState();
    _tags = ['Apple', 'balana', 'lenmo', 'eggs'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 5,
              children: [
                Chip(label: Text('Clip')),
                Chip(
                  label: Text('luoshen'),
                  backgroundColor: Colors.blueAccent,
                ),
                Chip(
                  label: Text('name'),
                  backgroundColor: Colors.blueAccent,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    child: Text('M'),
                  ),
                ),
                Chip(
                  label: Text('password....'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage('https://kkk.png'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete_outline),
                  deleteIconColor: Colors.deepPurpleAccent,
                  deleteButtonTooltipMessage: 'is delete tap?',
                ),
                Divider(
                  color: Colors.blueAccent,
                  height: 32,
                  indent: 64,
                  endIndent: 64,
                ),
                Wrap(
                  spacing: 8,
                  children: _tags.map((String tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                //下面是ActionChip()
                Divider(
                  color: Colors.blueAccent,
                  height: 32,
                  indent: 64,
                  endIndent: 64,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip:  $_checked'),
                ),
                Wrap(
                  spacing: 8,
                  children: _tags.map((String tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _checked = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                //下面是FilterChip()
//                Divider(
//                  color: Colors.blueAccent,
//                  height: 32,
//                  indent: 64,
//                  endIndent: 64,
//                ),
//                Container(
//                  width: double.infinity,
//                  child: Text('FilterChip:  ${_selects.toString()}'),
//                ),
//                Wrap(
//                  spacing: 8,
//                  children: _tags.map((String tag) {
//                    return FilterChip(
//                      label: Text(tag),
//                      selected: _selects.contains(tag),
//                      onSelected: (value) {
//                        setState(() {
//                          if (_selects.contains(tag)) {
//                            _selects.remove(tag);
//                          } else {
//                            _selects.add(tag);
//                          }
//                        });
//                      },
//                    );
//                  }).toList(),
//                ),
                //下面是ChoiceChip()
                Divider(
                  color: Colors.blueAccent,
                  height: 32,
                  indent: 64,
                  endIndent: 64,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip:  ${_select}'),
                ),
                Wrap(
                  spacing: 8,
                  children: _tags.map((String tag) {
                    return ChoiceChip(
                      selectedColor: Colors.black54,
                      label: Text(tag),
                      selected: _select == tag,
                      onSelected: (value) {
                        setState(() {
                          _select = tag;
                        });
                      },
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          setState(() {
            _tags = ['Apple', 'balana', 'lenmo', 'egg'];
            _selects = [];
            _select = 'Apple';
          });
        },
      ),
    );
  }
}
