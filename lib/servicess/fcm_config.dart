import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.max,
);
void initMessage() async {
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
      await firebaseMessaging
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else {
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      var androidInit =
          const AndroidInitializationSettings('mipmap/ic_launcher');
      var iosInit = const IOSInitializationSettings();
      var initSetting =
          InitializationSettings(android: androidInit, iOS: iosInit);

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      flutterLocalNotificationsPlugin.initialize(initSetting);

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log("Handling a in app message: ${message.messageId}");
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title! + 'onApp',
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channelDescription: channel.description,
                  icon: 'launch_background',
                  importance: Importance.max,
                //  priority: Priority.high,
                 //ongoing: true,
                ),
              ));
        }
      });

      firebaseMessaging
          .getInitialMessage()
          .then((RemoteMessage? message) {
        if (message != null) {
          log('vvvvvvvvvvvvvvvvvvvv');
          log(message.data.toString());
        }
      });

      // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //   log('A new onMessageOpenedApp event was published!');
      // });


    }
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    log('---Permission notification---: provisional');
  } else {
    log('---Permission notification---: declined or has not accepted');
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var androidInit = AndroidInitializationSettings('mipmap/ic_launcher');
  var iosInit = IOSInitializationSettings();
  var initSetting = InitializationSettings(android: androidInit, iOS: iosInit);

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  flutterLocalNotificationsPlugin.initialize(initSetting);

  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  log(channel.id + channel.name);
  if (notification != null && android != null) {
    // flutterLocalNotificationsPlugin.cancelAll();
    // Future.delayed(Duration(seconds: 2));
    log('gggffffffffffffffffff');
    // flutterLocalNotificationsPlugin.show(
    //     notification.hashCode,
    //     notification.title!+'vvvvvvvvv',
    //     notification.body,
    //     NotificationDetails(
    //         android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           icon: 'launch_background',
    //         ),
    //         iOS: const IOSNotificationDetails()));
  }
  log("Handling a background message: ${message.messageId}");
}
