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
final List<String> _listRows = [
  'Laguage',
  'AppBar',
  'StackWidget',
  'RowColumn',
  'Image',
  'Buttons',
  'Expand',
  'Text',
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
      children: _listRows.map((String title) {
        return _buildRow(title);
      }).toList(),
    );
  }

  Widget _buildRow(String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        print('点击了 $title');
        Navigator.of(context).pushNamed(title);
      },
    );
  }
}
