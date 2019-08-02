# flutter_notification_permission

This plugin is a fork of [Vanethos/flutter_notification_permissions/](https://github.com/Vanethos/flutter_notification_permissions/) with iOS portion done in Objective C to avoid all the problems with swift in Flutter.

This plugin will not ask for permission to the user, it will silently check if the user has granted the notification permission or not.

The tricky part is that both on Android and iOS even if the user denied the push notification permission, the callback to register for push notifications will still be fired, but when you send one user will not see it.

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
