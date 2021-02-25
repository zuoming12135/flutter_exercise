import 'package:flutter/material.dart';

class RouterFirPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(children: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop({"key": "我回来了"});
              // Navigator.of(context).pushNamed(routeName)
            },
            child: Text("点我返回上一个页面")),
      ]),
    );
  }
}
