import 'dart:developer';
import 'dart:io';
import 'package:avengers_project/components/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FcmConfig with Utils {
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
  );

  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initMessage(Function(String?) onSelectNotification) async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    log('---FCM token---: ${token ?? ''}');

    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('---Permission notification---: granted');

      if (Platform.isIOS) {
        await firebaseMessaging.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      } else {
        firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
          if (message != null) {
            onSelectNotification(
                "Title: ${message.notification?.title ?? ''}\nBody: ${message.notification?.body ?? ''}");
          }
        });
        var androidInit =
            const AndroidInitializationSettings('mipmap/ic_launcher');
        var iosInit = const IOSInitializationSettings();
        var initSetting =
            InitializationSettings(android: androidInit, iOS: iosInit);

        flutterLocalNotificationsPlugin.initialize(initSetting,
            onSelectNotification: onSelectNotification);

        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(channel);

        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          log("Handling a in app message: ${message.messageId}");
          RemoteNotification? notification = message.notification;
          AndroidNotification? android = message.notification?.android;

          if (notification != null && android != null) {
            showNotification(
                title: notification.title, body: notification.body);
          }
        });

        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
          if (message != null) {
            onSelectNotification(
                "Title: ${message.notification?.title ?? ''}\nBody: ${message.notification?.body ?? ''}");
          }
        });
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('---Permission notification---: provisional');
    } else {
      log('---Permission notification---: declined or has not accepted');
    }
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    var androidInit = const AndroidInitializationSettings('mipmap/ic_launcher');
    var iosInit = const IOSInitializationSettings();
    var initSetting =
        InitializationSettings(android: androidInit, iOS: iosInit);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.initialize(initSetting);

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    log(channel.id + channel.name);
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.cancelAll();
      showNotification(title: notification.title, body: notification.body);
    }
    log("Handling a background message: ${message.messageId}");
  }

  static void showNotification({String? title, String? body}) {
    var notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: 'launch_background',
        ),
        iOS: const IOSNotificationDetails());
    flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails,
        payload: "Title: ${title ?? ''}\nBody: ${body ?? ''}");
  }
}
