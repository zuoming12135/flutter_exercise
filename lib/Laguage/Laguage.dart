
import 'package:flutter/material.dart';
const oneSecond = Duration(seconds: 1);
class Laguage extends StatelessWidget {
  User u = User();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('111'),

    );
  }



  Future<void> printWithDelay(String message) {
    return Future.delayed(oneSecond).then((value) {
      print(message);
    });
  }
}

class User {
  String username;
  int age;
  void printLog(){
    print('object');
  }
}
