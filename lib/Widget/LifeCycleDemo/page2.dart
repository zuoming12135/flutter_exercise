import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('page2 initState');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('page2 didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('page2 build');
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('返回第一个页面')),
      ),
    );
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print('page2 setState');
  }

  @override
  void didUpdateWidget(page2 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('page2 didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('page2 deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('page2 dispose');
  }
}
