import 'package:flutter/material.dart';
import 'FormList.dart';
import 'RouterFirPage.dart';

// 路由跳转
// 1.Navigator.of(context).push(MaterialPageRoute(builder: (context) => 下一个页面));
// 2.Navigator.of(context).pushNamed(routeName,arguments)：需要提前注册页面和路由key，可以直接跳转页面注册的路由key,arguments支持带参数，then()函数可以获取反参
// 3.混合跳转 原生页面和flutter页面都有的路由跳转

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print("args${args}");

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            FlatButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => RouterFirPage())).then((value) {
                  //
                  // });
                  // then()获取反参
                  Navigator.of(context)
                      .pushNamed("RouterFirPage")
                      .then((value) {
                    setState(() {
                      print("反参$value");
                    });
                  });
                  // Navigator.of(context).pushNamed(routeName)
                },
                child: Text("点我进入下一个页面")),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).pushNamed(routeName)
                },
                child: Text("点我返回上一个页面")),
          ],
        ),
      ),
    );
  }
}
