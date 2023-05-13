import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessageHelper {
  FirebaseMessageHelper._();
  static late FirebaseMessaging messaging;

  /// this function will initialize firebase and fcm instance
  static Future<void> init() async {
    try {
      messaging = FirebaseMessaging.instance;
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
    } catch (error) {
      debugPrint('PushNotificationError: $error');
    }
  }

  @pragma('vm:entry-point')
//handle fcm notification when app is in background
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    debugPrint("onBackgroundMessage: ${message.data}");
    await handleNotifications(payload: message.data);
  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    debugPrint("onMessage: ${message.data}");
    await handleNotifications(payload: message.data);
  }

  static handleNotifications({required Map<String, dynamic> payload}) async {
    await AwesomeNotifications().createNotificationFromJsonData(payload);
  }
}
