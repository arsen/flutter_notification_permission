package com.example.notification_permission;

import android.content.Context;
import androidx.core.app.NotificationManagerCompat;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** NotificationPermissionPlugin */
public class NotificationPermissionPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "notification_permission");
    channel.setMethodCallHandler(new NotificationPermissionPlugin(registrar));
  }

  private static final String PERMISSION_GRANTED = "granted";
  private static final String PERMISSION_DENIED = "denied";

  private final Context context;

  private NotificationPermissionPlugin(Registrar registrar) {
    this.context = registrar.activity();
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getNotificationPermission")) {
      result.success(getNotificationPermissionStatus());
    } else {
      result.notImplemented();
    }
  }

  private String getNotificationPermissionStatus() {
    return (NotificationManagerCompat.from(context).areNotificationsEnabled())
            ? PERMISSION_GRANTED
            : PERMISSION_DENIED;
  }
}
