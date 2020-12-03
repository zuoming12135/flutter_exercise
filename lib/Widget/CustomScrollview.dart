

import 'package:flutter/material.dart';

class CustomScrollviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomeScrollview'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text('自定义'),
                floating: true,
                flexibleSpace: Image.asset(
                  'assets/cat-1.jpg',
                  fit: BoxFit.cover,
                ),
                expandedHeight: 200,
              ),
              SliverList(delegate:
              SliverChildBuilderDelegate(
                  (context , index) => ListTile(title: Text('text $index')),
                childCount: 100
              ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
