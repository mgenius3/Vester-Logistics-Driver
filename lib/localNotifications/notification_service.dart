import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import '../app/tabPages/home_tab.dart';

class NotificationService {
  //Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init(BuildContext context) async {
    //Initialization Settings for Android
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher.png');

    //Initialization Settings for iOS
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    //InitializationSettings for initializing settings for both platforms (Android & iOS)
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: ((payload) =>
            selectNotification(context, payload)));
  }

  Future selectNotification(context, payload) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => HomeTabPage()),
    );
  }

  Future<void> showNotifications(RideID) async {
    await flutterLocalNotificationsPlugin.show(
      NOTIFICATION_ID,
      'Ride Request',
      RideID,
      platformChannelSpecifics,
      payload: 'Notification Payload',
    );
  }

  Future<void> cancelNotifications() async {
    await flutterLocalNotificationsPlugin.cancel(NOTIFICATION_ID);
  }
}

const AndroidNotificationDetails _androidNotificationDetails =
    AndroidNotificationDetails(
  'Gocab',
  'Gocab Notifications',
  'Ride Request',
  playSound: true,
  priority: Priority.high,
  importance: Importance.max,
);

const IOSNotificationDetails _iosNotificationDetails = IOSNotificationDetails(
  presentAlert: true,
  presentBadge: true,
  presentSound: true,
);

const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: _androidNotificationDetails, iOS: _iosNotificationDetails);

const int NOTIFICATION_ID = 0; // Unique ID for this notification