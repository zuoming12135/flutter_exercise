import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView常见的几种方法",
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView 几种常见用法'),
          centerTitle: true,
        ),
        // body: _buildListView1(),
        body: _buildListView2(),
      ),
    );
  }

  // 提供子widget创建方法，只有在需要展示的时候才创建
  ListView _buildListView2() {
    return ListView.builder(
        itemExtent: 50,
        itemCount: 100,
        itemBuilder: (BuildContext contentx, int index) {
         return ListTile(
            title: Text('build $index'),
            subtitle: Text('body $index'),
          );
        }, );
  }

  // 设置分割线的方式
  ListView _buildListView1() {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text("title $index"),
      ),
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 1,
        color: Colors.red,
      ),
      itemCount: 100,

    );
  }
}
