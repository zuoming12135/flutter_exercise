import 'package:flutter/material.dart';

//


class ExpandWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandStateFulWidget();
  }
}

class ExpandStateFulWidget extends StatefulWidget {
  @override
  _ExpandStateFulWidgetState createState() => _ExpandStateFulWidgetState();
}

class _ExpandStateFulWidgetState extends State<ExpandStateFulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
      ),
      body: Column(
        children: [
          _Test2(),
          SizedBox(
            height: 20,
          ),
          _Test1(),
          SizedBox(
            height: 20,
          ),
          _Test(),
        ],
      ),
    );
  }

  Widget _Test2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.amber,
                  height: 100,
                ),
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.cyan,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  '在Row，column，Flex等包含多个子组件的组件中，Expand可以让子组件填满剩余的空间。多个子组件还可以设置flex来控制占据主轴控件的比例')),
        ],
      ),
    );
  }
}

class _Test1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: 40,
            color: Colors.amber,
            child: Text('amber'),
          ),
        ),Expanded(
          flex: 2,
          child: Container(
            height: 40,
            color: Colors.red,
            child: Text('red'),
          ),
        ), Expanded(
          flex: 1,
          child: Container(
            height: 40,
            color: Colors.cyan,
            child: Text('cyan'),
          ),
        ),
      ],
    );
  }
}
String _title = '这里的文字是动态的展示多行的数据，Expanded可以包裹左边的Text组件，右边的btn控制大小';
class _Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(child: Text('$_title')),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 60,
            height: 60,
            child: RaisedButton(
              onPressed: () {},
              child: Text('订购'),
            ),
          ),
        ],
      ),
    );
  }
}
