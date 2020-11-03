import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('page1 initState');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('page1 didChangeDependencies');
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print('page1 setState');
  }

  // Widget配置发生变化时，父Widget触发重建，热重载时候，系统会调用这个函数
  @override
  void didUpdateWidget(page1 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('page1 didUpdateWidget');
  }

  // 在组件树中移除会调动这个方法
  @override
  void deactivate() {
    // TODO: implement deactivate
    print('page1 deactivate');
    super.deactivate();
  }

  // State永久的从视图树种移除，调用该方法。可以释放资源，移除监听等。
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('page1 dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('page1 didUpdateWidget');
    return Scaffold(
      appBar: AppBar(
        actions: [
          RaisedButton(
            onPressed: () {
              setState(() {
                // 会调用setState方法和didUpdateWidget方法
              });
            },
            child: Text('调用setState'),
          )
        ],
        title: Text('page1'),
        centerTitle: true,
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed('page2');
            },
            child: Text('跳转page2')),
      ),
    );
  }
}
