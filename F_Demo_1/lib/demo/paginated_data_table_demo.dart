import 'package:flutter/material.dart';
import 'package:F_Demo_1/model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  PaginatedDataTableDemo({Key? key}) : super(key: key);

  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  late int _sortColumnIndex;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PaginatedDataTable(
              header: Text('Posts'),
              rowsPerPage: 5,
              source: _postDataSource,
              //定制全选状态
              onSelectAll: (bool? value) {},
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
                  onSort: (int columnIndex, bool ascending) {
                    //方法传入两个参数，第一个参数是一个方法
                    _postDataSource._sort(
                        (post) => post.title.length, ascending);

                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;

                      // posts.sort((a, b) {
                      //   if (!ascending) {
                      //     final c = a;
                      //     a = b;
                      //     b = c;
                      //   }
                      //   //比较a和b的标题长度
                      //   return a.title.length.compareTo(b.title.length);
                      // });
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
            )
          ],
        ),
      ),
    );
  }
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];

    return DataRow.byIndex(cells: [
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
      DataCell(Image.network(post.imageUrl)),
    ], index: index);
  }

//注意这个比较方法
  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}
