import 'package:flutter/material.dart';

class Interaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureInteraction();
    // Listener监听手指的触摸时间，比如移动，触摸，抬起
    return Listener(
      onPointerDown: (event) => print('down $event'),
      onPointerMove: (event) => print('move $event'),
      onPointerUp: (event) => print('up $event'),
      child: Center(
        child: Container(
          color: Colors.cyan,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}

double _top = 0.0;
double _left = 0.0;

class GestureInteraction extends StatefulWidget {
  @override
  _GestureInteractionState createState() => _GestureInteractionState();
}

// 手势监听
class _GestureInteractionState extends State<GestureInteraction> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          // 控制stack子widget的位置
          top: _top,
          left: _left,
          child: GestureDetector(
            onTap: () => print("父视图ontap"),
            child: Container(
              child: GestureDetector(
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                ),
                onTap: () => print("Tap"),
                onTapDown: (detail) => print("TapDown"),
                onDoubleTap: () => print("onDoubleTap"),
                onLongPress: () => print("onLongPress"),
                // onScaleUpdate: (e) {
                //   setState(() {
                //
                //     print('scale ${e.scale}');
                //   });
                // },
                onPanUpdate: (detail) {
                  setState(() {
                    _left += detail.delta.dx;
                    _top += detail.delta.dy;
                  });
                },
              ),
            ),

          ),
        )
      ],
    );
  }
}
