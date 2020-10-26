import 'package:flutter/material.dart';

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
      body: Center(
        child: Row(
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
      ),
    );
  }
}
