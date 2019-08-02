#import "NotificationPermissionPlugin.h"
@import UserNotifications;


@implementation NotificationPermissionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"notification_permission"
            binaryMessenger:[registrar messenger]];
  NotificationPermissionPlugin* instance = [[NotificationPermissionPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getNotificationPermission" isEqualToString:call.method]) {
      
      
      UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
      [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings){
          //1. Query the authorization status of the UNNotificationSettings object
          switch (settings.authorizationStatus) {
              case UNAuthorizationStatusAuthorized:
                  result(@("granted"));
                  break;
              case UNAuthorizationStatusDenied:
                  result(@("denied"));
                  break;
              case UNAuthorizationStatusNotDetermined:
                  result(@("unknown"));
                  break;
              default:
                  result(@("unknown"));
                  break;
          }
      }];
      
      
   
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
