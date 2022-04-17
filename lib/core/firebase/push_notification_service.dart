import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../ui/modules/notification/screens/notification_screen.dart';



class PushNotificationService {
  static init(context) async {
    // await FirebaseMessaging.instance.getToken();
   await getDeviceToken();
    // workaround for onLaunch: When the app is completely closed (not in the background) and opened directly from the push notification
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(context, NotificationScreen.routeName);
      }
    });

    // onMessage: When the app is open and it receives a push notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification:\n${message.notification!.title}\n${message.notification!.body}');
      }
    });

    // replacement for onResume: When the app is in the background and opened directly from the push notification.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Got a message whilst in the background!');

     Navigator.pushNamed(context, NotificationScreen.routeName);
      
    });
  }

  static getDeviceToken() async {
    String? deviceToken = await FirebaseMessaging.instance.getToken();
    print("deviceFirebase Token: $deviceToken");
    // LocalStorageService().setToken(deviceToken);
    return deviceToken;
  }

  // static serialiseAndNavigate(Map<String, dynamic> message, context) {
  //   var notificationData = message['data'];
  //   var view = notificationData['view'];
  //   if (view != null) {
  //     // navigate
  //     Navigator.pushNamed(context, view, arguments: message['data']);
  //   }
  // }
}
