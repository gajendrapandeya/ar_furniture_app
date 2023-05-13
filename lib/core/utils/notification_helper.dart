import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationsHelper {
  // prevent making instance
  NotificationsHelper._();

  // Notification lib
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();

  static init() async {
    await _initNotification();
    await awesomeNotifications.requestPermissionToSendNotifications();
  }

  ///init notifications channels
  static _initNotification() async {
    await awesomeNotifications.initialize(
      null, // null mean it will show app icon on the notification (status bar)
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
        )
      ],
    );
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    /// Control click action on notification
    // Map<String, String?>? payload = receivedAction.payload;
  }
}
