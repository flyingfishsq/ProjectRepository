import 'package:F_Demo_1/model/post.dart';
import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo({Key key}) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DataTable(
              //定制全选状态
              onSelectAll: (bool value) {},
              //用来作为排序的列序号
              sortColumnIndex: _sortColumnIndex,
              //未真表示升序排列，为假表示降序排列
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  //通过放在Container里设置宽度
                  // label: Container(
                  //   child: Text('Title'),
                  //   // width: 150.0,
                  // ),
                  label: Text('Title'),
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;

                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        //比较a和b的标题长度
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
              //手动赋值
              // rows: [
              //   DataRow(
              //     cells: [
              //       DataCell(Text('Hello ~')),
              //       DataCell(Text('Flyingfish')),
              //     ],
              //   ),
              //   DataRow(
              //     cells: [
              //       DataCell(Text('Hola ~')),
              //       DataCell(Text('Flyingfish')),
              //     ],
              //   ),
              //   DataRow(
              //     cells: [
              //       DataCell(Text('您好 ~')),
              //       DataCell(Text('Flyingfish')),
              //     ],
              //   ),
              // ],
              rows: posts.map((post) {
                return DataRow(
                  selected: post.selected,
                  onSelectChanged: (bool value) {
                    setState(() {
                      if (post.selected != value) {
                        post.selected = value;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl)),
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
