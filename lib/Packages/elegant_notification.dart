import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ElegantNotification.success(
                    width: 360,
                    notificationPosition: NotificationPosition.topCenter,
                    animation: AnimationType.fromTop,
                    title: const Text('Update'),
                    description: const Text('Your data has been updated'),
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.green,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Success theme notification\n(top left)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification.error(
                    width: 360,
                    notificationPosition: NotificationPosition.topRight,
                    animation: AnimationType.fromRight,
                    title: const Text('Error'),
                    description: const Text('Please verifiy your data'),
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Error theme notification\n(top right)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ElegantNotification.info(
                    width: 360,
                    notificationPosition: NotificationPosition.centerLeft,
                    animation: AnimationType.fromLeft,
                    title: const Text('Info'),
                    description: const Text(
                      'This account will be updated once you exit',
                    ),
                    showProgressIndicator: false,
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Info theme notification\n(center left)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification(
                    width: 360,
                    notificationPosition: NotificationPosition.centerRight,
                    animation: AnimationType.fromRight,
                    title: const Text(
                      'New version',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    description: const Text(
                      'A new version is available to you please update.',
                    ),
                    icon: const Icon(
                      Icons.access_alarm,
                      color: Colors.orange,
                    ),
                    progressIndicatorColor: Colors.orange,
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Custom notification\n(center right)',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ElegantNotification.info(
                    width: 360,
                    notificationPosition: NotificationPosition.bottomLeft,
                    animation: AnimationType.fromLeft,
                    title: const Text('Info'),
                    description: const Text(
                      'This account will be updated once you exit',
                    ),
                    action: const Text(
                      'Link',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                    onActionPressed: () {},
                    showProgressIndicator: false,
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Notification with action\n(bottom left)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification(
                    width: 360,
                    notificationPosition: NotificationPosition.bottomRight,
                    animation: AnimationType.fromBottom,
                    description: const Text(
                      'A new version is available to you please update.',
                    ),
                    icon: const Icon(
                      Icons.access_alarm,
                      color: Colors.orange,
                    ),
                    progressIndicatorColor: Colors.orange,
                    showProgressIndicator: false,
                    autoDismiss: false,
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Elegant notification without title\n(bottom right)',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ElegantNotification(
                    width: 360,
                    notificationPosition: NotificationPosition.topRight,
                    animation: AnimationType.fromRight,
                    description: const Text(
                      'You can now leave the dashboard.',
                    ),
                    icon: const Icon(
                      Icons.dashboard_customize_outlined,
                      color: Colors.purple,
                    ),
                    progressIndicatorColor: Colors.purple,
                    showProgressIndicator: false,
                    autoDismiss: false,
                    closeButton: (dismiss) => Container(
                      margin: Directionality.of(context) == TextDirection.rtl
                          ? const EdgeInsets.only(left: 20)
                          : const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        onPressed: dismiss,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.purple, // <-- Button color
                          foregroundColor: Colors.white, // <-- Splash color
                        ),
                        child: const Icon(Icons.logout, color: Colors.white),
                      ),
                    ),
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Notification with custom close button\n(top right)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification.success(
                    description:
                    const Text('Your account has been created succesfully'),
                    progressBarHeight: 10,
                    progressBarPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    progressIndicatorBackground: Colors.green[100]!,
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Custom progress bar sizes',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}