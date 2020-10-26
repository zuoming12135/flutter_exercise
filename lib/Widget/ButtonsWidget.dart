
import 'package:flutter/material.dart';

 List<String> _downTitles = ['扫一扫', '付款', '电话客服'];

class ButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('button'),
          actions: [
            DropDownBtn(),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // 不可点击按钮
                DisabledBtn(),
                const SizedBox(height: 20),
                // 可以点击按钮
                EnabledBtn(),
                const SizedBox(height: 20),

                GradientBtn(),
                const SizedBox(height: 20),
                // 左边图片右边文字
                IconBtn(),
                const SizedBox(height: 20),
                CircleBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DisabledBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: null,
      disabledColor: Colors.black12,
      child: Text(
        '不可点击按钮',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class EnabledBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.cyan,
      textColor: Colors.red,
      child: const Text(
        '可点击按钮',
        style: TextStyle(fontSize: 16),
      ),
      onPressed: () {},
    );
  }
}

class GradientBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      textColor: Colors.white,
      // 设置padding将左右边距缩小
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        // 文字填满按钮
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[Colors.red, Colors.cyan])),
        child: Text(
          '渐变色按钮',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class IconBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      onPressed: () {
        print('点我了');
      },
      color: Colors.red,
      label: Text(
        '文字',
        style: TextStyle(fontSize: 16),
      ),
      icon: Icon(
        Icons.ac_unit,
        size: 30,
        color: Colors.cyan,
      ),
    );
  }
}

class CircleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        onPressed: () {
          print('点击了圆形按钮');
        },
        child: Text(
          '圆形按钮',
          style: TextStyle(fontSize: 14, color: Colors.red),
        ),
      ),
    );
  }
}

class DropDownBtn extends StatefulWidget {
  @override
  _DropDownBtnState createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  String dropdownValue = '扫一扫';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value:dropdownValue ,
        items: _downTitles
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged:(String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        }
    );
  }
}
