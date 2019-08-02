# flutter_notification_permission

This plugin is a fork of [Vanethos/flutter_notification_permissions/](https://github.com/Vanethos/flutter_notification_permissions/) with iOS portion done in Objective C to avoid all the problems with swift in Flutter.

```
import 'package:notification_permission/notification_permission.dart';

var result = await NotificationPermission.getNotificationPermission();
if (result == NotificationPermissionStatus.denied) {
  _permission = 'denied';
} else if (result == NotificationPermissionStatus.granted) {
  _permission = 'granted';
} else {
  _permission = 'unknown';
}
```
