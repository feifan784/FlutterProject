import 'package:flutter/material.dart';
import 'package:flutter_app/model/PostSub.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  final List<PostSub> postSubList = [
    PostSub(
        "百度wqwe",
        "王洪1",
        "http://pic.netbian.com/uploads/allimg/201228/214304-1609162984f208.jpg",
        'nihao1'),
    PostSub(
        "阿里ewqeqeqeqwe",
        "马云1",
        "http://pic.netbian.com/uploads/allimg/200410/213246-1586525566c099.jpg",
        'nihao2'),
    PostSub(
        "百度qwtfff",
        "王洪2",
        "http://pic.netbian.com/uploads/allimg/200714/224033-159473763328ff.jpg",
        'nihao3'),
    PostSub(
        "阿里",
        "马云2",
        "http://pic.netbian.com/uploads/allimg/210103/232202-16096873226fa1.jpg",
        'nihao14'),
    PostSub(
        "百度dfdf",
        "王洪3",
        "http://pic.netbian.com/uploads/allimg/210104/001409-16096904495aba.jpg",
        'nihao5'),
    PostSub(
        "阿里dfdaqqqqqzzzz",
        "马云3",
        "http://pic.netbian.com/uploads/allimg/190909/193047-15680286478a48.jpg",
        'nihao6'),
    PostSub(
        "百度wqwe",
        "王洪1",
        "http://pic.netbian.com/uploads/allimg/201228/214304-1609162984f208.jpg",
        'nihao1'),
    PostSub(
        "阿里ewqeqeqeqwe",
        "马云1",
        "http://pic.netbian.com/uploads/allimg/200410/213246-1586525566c099.jpg",
        'nihao2'),
    PostSub(
        "百度qwtfff",
        "王洪2",
        "http://pic.netbian.com/uploads/allimg/200714/224033-159473763328ff.jpg",
        'nihao3'),
    PostSub(
        "阿里",
        "马云2",
        "http://pic.netbian.com/uploads/allimg/210103/232202-16096873226fa1.jpg",
        'nihao14'),
    PostSub(
        "百度dfdf",
        "王洪3",
        "http://pic.netbian.com/uploads/allimg/210104/001409-16096904495aba.jpg",
        'nihao5'),
    PostSub(
        "阿里dfdaqqqqqzzzz",
        "马云3",
        "http://pic.netbian.com/uploads/allimg/190909/193047-15680286478a48.jpg",
        'nihao6')
  ];

  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DataTable(
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
//                onSelectAll: (value) {
//                  print(value);
//                },
                columns: [
                  DataColumn(
                      label: Text('title'),
                      onSort: (int index, bool assending) {
                        setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = assending;

                          postSubList.sort((a, b) {
                            if (assending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            return a.title.length.compareTo(b.title.length);
                          });
                        });
                      }),
                  DataColumn(label: Text('author')),
                  DataColumn(label: Text('image')),
                ],
                rows: postSubList.map((postSub) {
                  return DataRow(
                      selected: postSub.select,
                      onSelectChanged: (value) {
                        setState(() {
                          if (postSub.select != value) {
                            postSub.select = value;
                          }
                        });
                      },
                      cells: [
                        DataCell(Text(postSub.title)),
                        DataCell(Text(postSub.author)),
                        DataCell(Image.network(postSub.imageUrl)),
                      ]);
                }).toList())
          ],
        ),
      ),
    );
  }
}
