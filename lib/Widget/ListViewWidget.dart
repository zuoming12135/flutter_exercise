import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView常见的几种方法",
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[],
          title: Text('ListView 几种常见用法'),
          centerTitle: true,
        ),
        // body: _buildListView1(),
        // body: _buildListView2(),
        body: AppStoreUpdateExample(),
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
      },
    );
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








// 更新列表
class UpdateItemBean {
  String iconImg;
  String title;
  String date;
  String desc;

  UpdateItemBean({this.iconImg, this.title, this.date, this.desc});
}

final List<UpdateItemBean> _listItems = [
  UpdateItemBean(
      iconImg: "assets/cat-1.jpg",
      title: "Airbnb爱彼迎",
      date: "2天前",
      desc: "进一步提高稳定性，让您在管理房源和行程时更得心应手"),
  UpdateItemBean(
      iconImg: "assets/dog-1.jpg",
      title: "小米有品",
      date: "2天前",
      desc: "进一步提高稳定性，暖冬感恩季有品双12欢乐来袭"),
];

class AppStoreUpdateExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) =>
            _buildRow(bean: _listItems[index]),
          separatorBuilder: (BuildContext context, int index) => Divider(
            indent: 10,
              endIndent: 10,
              height: 0.5,
              color: Colors.grey,
            ),
        itemCount: _listItems.length);
    return ListView(
      children: <Widget>[
        _buildRow(bean: _listItems[0]),
      ],
    );
  }
}

class _buildRow extends StatelessWidget {
  final UpdateItemBean bean;

  const _buildRow({Key key, this.bean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: <Widget>[
          _buildTop(context),
          _buildBottom(context),
        ],
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          bean.iconImg,
          width: 80,
          height: 80,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bean.title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  bean.date,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        FlatButton(onPressed: () {}, child: Text("更多")),
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(bean.desc),
        Text('more'),
      ],
    );
  }
}
