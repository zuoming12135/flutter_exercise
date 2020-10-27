import 'package:flutter/material.dart';

String _showText =
    'The Text widget displays a string of text with single style.The style argument is optional.';
String _chinestShowText = '文本组件';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          Text(
            'textAlign property',
            style: TextStyle(
                color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            _showText,
            textAlign: TextAlign.left,

            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _showText,
            textAlign: TextAlign.right,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _showText,
            textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _showText,
            textAlign: TextAlign.justify,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _showText,
            // textDirection: r,
            textAlign: TextAlign.start,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _showText,
            textAlign: TextAlign.end,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'overflow property',
            style: TextStyle(
                color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _showText,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _showText,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _showText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _showText,
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                backgroundColor: Colors.cyan),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'style property',
            style: TextStyle(
                color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _showText,
            style: TextStyle(
              fontSize: 20,
              // 字体大小
              fontWeight: FontWeight.bold,
              // 字重
              fontFamily: 'Chilanka',
              //自定义字体
              color: Colors.amber,
              // 文字颜色
              backgroundColor: Colors.grey,
              // Text组件背景色
              // letterSpacing: 2,// 中英文文字设置都可以控制间距，负值可让文字紧凑一些
              wordSpacing: 15, // 中文文字设置没有效果，设置两个英文单词之间的间距，单词内的字符间距不改变
              // height: 100
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _showText,
            style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.red),
          ),

          SizedBox(
            height: 50,
          ),
          Text('文本装饰decoration：包含下划线，删除线，上划线样式',style: TextStyle(
            color: Colors.red
          ),),
          Text(
            _chinestShowText,
            style: TextStyle(
                fontSize: 40,
                decoration: TextDecoration.underline,
                // 文本装饰 underline 下划线， lineThrough 删除线，overline 上划线
                decorationStyle: TextDecorationStyle.wavy,
                // 装饰的样式,solid 实现 dashed 虚线 double两条线 dotted点状线 wavy 波浪线
                decorationColor: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),

          Text(
            _chinestShowText,
            style: TextStyle(
                fontSize: 40,
                decoration: TextDecoration.overline,
                // 文本装饰 underline 下划线， lineThrough 删除线，overline 上划线
                decorationStyle: TextDecorationStyle.wavy,
                // 装饰的样式,solid 实现 dashed 虚线 double两条线 dotted点状线 wavy 波浪线
                decorationColor: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _chinestShowText,
            style: TextStyle(
                fontSize: 40,
                decoration: TextDecoration.lineThrough,
                // 文本装饰 underline 下划线， lineThrough 删除线，overline 上划线
                decorationStyle: TextDecorationStyle.wavy,
                // 装饰的样式,solid 实现 dashed 虚线 double两条线 dotted点状线 wavy 波浪线
                decorationColor: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _chinestShowText,
            style: TextStyle(
                fontSize: 40,
                decoration: TextDecoration.lineThrough,
                // 文本装饰 underline 下划线， lineThrough 删除线，overline 上划线
                decorationStyle: TextDecorationStyle.solid,
                // 装饰的样式,solid 实现 dashed 虚线 double两条线 dotted点状线 wavy 波浪线
                decorationColor: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _chinestShowText,
            style: TextStyle(
                fontSize: 40,
                decoration: TextDecoration.lineThrough,
                // 文本装饰 underline 下划线， lineThrough 删除线，overline 上划线
                decorationStyle: TextDecorationStyle.double,
                // 装饰的样式,solid 实现 dashed 虚线 double两条线 dotted点状线 wavy 波浪线
                decorationColor: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _chinestShowText,
            style: TextStyle(
                fontSize: 40,
                decoration: TextDecoration.lineThrough,
                // 文本装饰 underline 下划线， lineThrough 删除线，overline 上划线
                decorationStyle: TextDecorationStyle.dotted,
                // 装饰的样式,solid 实现 dashed 虚线 double两条线 dotted点状线 wavy 波浪线
                decorationColor: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _chinestShowText,
            style: TextStyle(
                fontSize: 40,
                decoration: TextDecoration.lineThrough,
                // 文本装饰 underline 下划线， lineThrough 删除线，overline 上划线
                decorationStyle: TextDecorationStyle.dashed,
                // 装饰的样式,solid 实现 dashed 虚线 double两条线 dotted点状线 wavy 波浪线
                decorationColor: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),

          Text(
            'Text widget',
            style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.lineThrough,
                // 文本装饰 underline 下划线， lineThrough 删除线，overline 上划线
                decorationStyle: TextDecorationStyle.wavy,
                // 装饰的样式,solid 实现 dashed 虚线 double两条线 dotted点状线 wavy 波浪线
                decorationColor: Colors.red,
                decorationThickness: 2 // 装饰线的宽度

                ),
          ),
        ],
      ),
    );
  }
}
