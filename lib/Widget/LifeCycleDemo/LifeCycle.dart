import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  @override
  _LifeCycleState createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluter生命周期"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Text("""Flutter Widget生命周期大概氛围3个阶段:
               1.创建：
            
               构造方法：Flutter通过StatefulWidget.createState()创建State。可以通过此方法接收父Widget传递的初始UI配置数据，决定初始呈现效果。
               initState：对象被插入视图树的时候调用，只会调用一次，可以作初始化工作。
               didChangeDependencies：专门处理State对象依赖关系，initState方法后被Flutter调用， 对象以来发生改变也会调用(此方法会多次被调用)。
               buid：构建视图，返回一个Widget。
               
               2.更新：
               
               setState：数据状态发生改变，调用此方法。
               didChangeDependencies：对象依赖关系变了，会调用此方法，比如系统语言或者应用的主题改变了，会执行该方法。
               didUpdateWidget:Widget配置发生变化的时候，调用此方法。比如父widget触发重新构建的时候。
               
               3.销毁：
               
               deactivate:在组件树中移除会调动这个方法。
               dispose:组件释放调用。该方法类似于iOS的dealloc方法，移除监听，资源释放 。
          """),
          SizedBox(
            height: 10,
          ),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('page1');
                print('page1 跳转page2');
              },
              child: Text('跳转页面')),
        ],
      ),
    );
  }
}
