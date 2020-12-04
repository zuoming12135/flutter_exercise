import 'dart:ui';

import 'package:flutter/material.dart';
import 'CustomAppBar.dart';
import 'StackWidget.dart';
import 'package:flutter_exercise/Laguage/Laguage.dart';
import 'RowColumn.dart';
import 'imageWidget.dart';
import 'ButtonsWidget.dart';
import 'ExpandWidget.dart';
import 'TextWidget.dart';
import 'LifeCycleDemo/LifeCycle.dart';
import 'LifeCycleDemo/page2.dart';
import 'LifeCycleDemo/page1.dart';
import 'package:flutter_exercise/Beans.dart';

import 'Observer.dart';
import 'ListViewWidget.dart';
import 'CustomScrollview.dart';
final List<ListBean> _listRows = [
  ListBean(title: 'Laguage', detail: '自定义语言') ,
  ListBean(title: 'AppBar', detail: 'Material风格AppBar') ,
  ListBean(title: 'StackWidget', detail: '栈控件，可展示多个控件') ,
  ListBean(title: 'RowColumn', detail: '横向或者竖向多控件集合展示控件') ,
  ListBean(title: 'Image', detail: '三种加载图片方式') ,
  ListBean(title: 'Buttons', detail: '常见的按钮控件') ,
  ListBean(title: 'Expand', detail: 'Expand包裹的子控件可以填满剩余的空间') ,
  ListBean(title: 'Text', detail: '显示文本组件') ,
  ListBean(title: 'LifeCycle', detail: 'Flutter生命周期') ,

  ListBean(title: 'Observer', detail: '监听状态') ,
  ListBean(title: 'ListView', detail: 'ListView常见的用法') ,
  ListBean(title: 'CustomScrollview', detail: 'CustomScrollview') ,


];

class HomePage extends StatelessWidget {
  static const String _title = 'Flutter 教程总结';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyHomePageState(),
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        'Laguage': (BuildContext context) => Laguage(),
        'StackWidget': (BuildContext context) => StackWidget(),
        'RowColumn': (BuildContext context) => RowColumn(),
        'Image': (BuildContext context) => ImageWidget(),
        'Buttons': (BuildContext context) => ButtonsWidget(),
        'Expand': (BuildContext context) => ExpandWidget(),
        'Text': (BuildContext context) => TextWidget(),
        'LifeCycle': (BuildContext context) => LifeCycle(),
        'page2': (BuildContext context) => page2(),
        'page1': (BuildContext context) => page1(),

        'Observer': (BuildContext context) => Observer(),
        'ListView': (BuildContext context) => ListViewWidget(),
        'CustomScrollview': (BuildContext context) => CustomScrollviewWidget(),

        // 'AppBar':(BuildContext context) => CustomAppBar(),
        // 'StackWidget':(BuildContext context) => StackWidget(),
        // 'StackWidget':(BuildContext context) => StackWidget(),
      },
    );
  }
}

class MyHomePageState extends StatefulWidget {
  @override
  _MyHomePageStateState createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '首页',
          style: TextStyle(
              // color: Colors.black,
              letterSpacing: 5,
              fontSize: 28,
              // fontWeight: FontWeight.bold,
              fontFamily: 'Chilanka'),
        ),
        leading: const Icon(Icons.add),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                print('map clicked');
              }),
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('search clicked');
              }),
        ],
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView(
      children: _listRows.map((ListBean bean) {

        return _buildRow(bean);
      }).toList(),
    );
  }

  Widget _buildRow(ListBean bean) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(bean.title),
          Text(bean.detail,style: TextStyle(fontSize: 13),)
        ],
      ),
      onTap: () {
        // print('点击了 $title');
        Navigator.of(context).pushNamed(bean.title);
      },
    );
  }
}

// class CustomListItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

