import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethondChanelTest extends StatelessWidget {
  static const platform = MethodChannel('exercise_Flutter_Channel');

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 200,
      color: Colors.cyan,
      child: FlatButton(
          onPressed: () {
            platform.invokeMethod("callHotLines");
          },
          child: Text("拨打电话")),
    );
  }
}
