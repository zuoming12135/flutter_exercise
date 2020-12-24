import 'package:flutter/material.dart';
// 表单页面需求常见于资料填写，密码输入，登录等功能模块
// TextField 自带onchanged回调函数，监听文本输入
// decoration属性可以修改输入框样式，可添加icon，hintText:占位文字等
// maxLength:限制输入文本长度
// keyboardType:键盘类型可以设置数字，手机号，常规键盘的
class FormList extends StatefulWidget {
  @override
  _FormListState createState() => _FormListState();
}

class _FormListState extends State<FormList> {
  final listenController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    listenController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    listenController.addListener(() {
      _printListenValue();
    });
    super.initState();
  }

  _printListenValue() {
    print("第二种监听输入框值得方法 ${listenController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("创建表单"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: <Widget>[

            TextField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(

                  icon: Icon(Icons.contact_phone),
                  hintText: "请输入请输入手机号",
                  /*border: InputBorder.none*/
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (String value) {
                return value.contains("@") ? null : "请使用邮箱";
              },
              decoration: InputDecoration(
                hintText: "请输入邮箱",
                icon: Icon(Icons.email),
              ),
              onChanged: (value) {
                print(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
