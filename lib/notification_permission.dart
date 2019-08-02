import 'dart:async';

import 'package:flutter/services.dart';

enum NotificationPermissionStatus {
  granted,
  denied,
  unknown,
}

class NotificationPermission {
  static const MethodChannel _channel =
      const MethodChannel('notification_permission');
      

  static Future<NotificationPermissionStatus>
      getNotificationPermission() async {
    final String status =
        await _channel.invokeMethod('getNotificationPermission');
    if (status == 'granted') {
      return NotificationPermissionStatus.granted;
    } else if (status == 'denied') {
      return NotificationPermissionStatus.denied;
    }

    return NotificationPermissionStatus.unknown;
  }
}
