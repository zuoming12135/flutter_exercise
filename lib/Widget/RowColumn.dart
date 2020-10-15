import 'package:flutter/material.dart';

// 实现9宫格
class RowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("rowColumn"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return NineGrid();
    
  }
}



class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisSize: MainAxisSize.max,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text('这一行hello world'),
        FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15),
          color: Colors.red,
// textColor: Colors.amber,
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              text: '本行 ',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(
                    text: 'bold',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.cyan,
          child: Text(
            '下一行inside ',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}

// 9宫格
class NineGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        RowItem(),

        RowItem(),
        RowItem(),

      ],
    );
  }
}


class RowItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
          height: 100,
          child: RaisedButton(
            color: Colors.cyan,
            onPressed: (){},
            child: Text('icons1'),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          child: RaisedButton(
            onPressed: (){},
            color: Colors.red,
            child: Text('icons2'),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          child: RaisedButton(
            color: Colors.amber,
            onPressed: (){},
            child: Text('icons3'),
          ),
        ),
      ],
    );
  }
}

class ColumnItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: null,
          child: Text('data'),
        ),
        RaisedButton(
          onPressed: null,
          child: Text('data'),
        ),
        RaisedButton(
          onPressed: null,
          child: Text('data'),
        ),
      ],
    );
  }
}
