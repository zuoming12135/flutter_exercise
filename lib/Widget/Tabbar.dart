import 'package:flutter/material.dart';
import 'package:flutter_exercise/Widget/HomePage.dart';

// 实现新闻类app的页面切换控件,tab有2中实现方式
// 1 DefaultTabController包装tabs，tab和tabbarview的长度要和DefaultTabController的length一致
// 2.可以创建Tabbarcontroller,tabs的controller属性和tabbarview的controller属性绑定创建的Tabbarcontroller，Tabbarcontroller addListener监听tab切换状态
//====================================================


// bottomNavigationBar
// 实现常见的app底部多个功能切换控件，多个模块
// 比如首页，我的等页面，实现多个模块页面的切换功能
class TabbarController extends StatefulWidget {
  @override
  _TabbarControllerState createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController>
    with SingleTickerProviderStateMixin {
  int _currentSelectIndex = 0;
  List<Widget> _vcs = [TimePage(), PhonePage()];
  TabController _tabCon;
  List _tabs = [
    "时间",
    "电话",
  ];

  @override
  void initState() {
    // TODO: implement initState
    _tabCon = TabController(length: _tabs.length, vsync: this);
    _tabCon.addListener(() {
      switch (_tabCon.index) {
        case 0:
          {
            print("0");
          }
          break;
        case 1:
          {
            print("1");
          }
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return case2();
    return case1();
  }

  void _selectIndexChanged(int index) {
    setState(() {
      _currentSelectIndex = index;
      // 这里也可以切换页面显示
    });
  }

  Widget case2 (){
    return Scaffold(
      appBar: AppBar(
        title: Text("tab第二种实现方式"),
        bottom: TabBar(
          // indicatorWeight: 0.1,
            indicatorColor: Colors.red,
            controller: _tabCon,
            tabs: _tabs.map((title) => Tab(text: title)).toList()),
      ),
      body: TabBarView(
        controller: _tabCon,
        children: _tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e),
          );
        }).toList(),
      ),
    );
  }
  Widget case1() {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text('TabBar第1中实现方法'),
              centerTitle: true,
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.access_time),
                  text: "时间",
                ),
                Tab(
                  icon: Icon(Icons.accessible),
                  text: "电话",
                ),
              ])),
          body: TabBarView(children: [
            Tab(
              icon: Icon(Icons.access_time),
              text: "时间",
            ),
            Tab(
              icon: Icon(Icons.accessible),
              text: "电话",
            ),
          ]),
          // body: _vcs[_currentSelectIndex],
          /*bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentSelectIndex,
            onTap: _selectIndexChanged,
            // selectedFontSize和unselectedFontSize设置一样大，没有差异效果
            selectedFontSize: 16,
            unselectedFontSize: 16,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                title: Text("时间"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.accessible),
                title: Text("电话"),
              ),
            ],
          ),*/
        ),
      ),
    );
  }
}

class TimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text("时间页面"),
      ),
    );
  }
}

class PhonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Center(
        child: Text("电话页面"),
      ),
    );
  }
}
