import 'package:flutter/material.dart';

class Observer extends StatefulWidget {
  @override
  _ObserverState createState() => _ObserverState();
}


class _ObserverState extends State<Observer> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }


  // 监听app生命状态
  //
  // 前台到后台 :resumed ==>inactive ==>paused
  //  后台唤醒app :paused ==>inactive ==>resumed

  /// The application is not currently visible to the user, not responding to
  /// user input, and running in the background.
  ///
  /// When the application is in this state, the engine will not call the
  /// [Window.onBeginFrame] and [Window.onDrawFrame] callbacks.

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  @override
  Future<bool> didPushRoute(String route) {
    // TODO: implement didPushRoute
    return super.didPushRoute(route);
  }

}
