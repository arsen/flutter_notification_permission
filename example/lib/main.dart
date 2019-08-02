import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:notification_permission/notification_permission.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _permission;

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkPermission() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    NotificationPermissionStatus result;
    try {
      result = await NotificationPermission.getNotificationPermission();
      if (result == NotificationPermissionStatus.denied) {
        _permission = 'denied';
      } else if (result == NotificationPermissionStatus.granted) {
        _permission = 'granted';
      } else {
        _permission = 'unknown';
      }
    } on PlatformException {
      _permission = 'error';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Permission is: $_permission\n'),
              SizedBox(height: 30),
              RaisedButton(
                child: Text('Check Permission'),
                onPressed: () {
                  checkPermission();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
