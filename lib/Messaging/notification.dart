import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  log('Message Received! ${message.notification!.title}');
}

class NotificationService {
  static Future<void> initialize() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(backgroundHandler);

      log("Message Intialized");
    }
  }
}
