import 'package:flutter/material.dart';
import 'package:flutter_app/model/PostData.dart';
import 'package:flutter_app/model/PostSub.dart';

class PostDataSource extends DataTableSource {
  final List<PostSub> posts = PostData().postSubList;
  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    PostSub postSub = posts[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(postSub.title)),
      DataCell(Text(postSub.author)),
      DataCell(Image.network(postSub.imageUrl)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => posts.length;

  @override
  int get selectedRowCount => _selectedCount;
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  final List<PostSub> postSubList = PostData().postSubList;

  final PostDataSource _postDataSource = PostDataSource();

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
            PaginatedDataTable(
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
//                rows: postSubList.map((postSub) {
//                  return DataRow(
//                      selected: postSub.select,
//                      onSelectChanged: (value) {
//                        setState(() {
//                          if (postSub.select != value) {
//                            postSub.select = value;
//                          }
//                        });
//                      },
//                      cells: [
//
//                      ]);
//                }).toList(),
              source: _postDataSource,
              header: Text('PostSub'),
            )
          ],
        ),
      ),
    );
  }
}
