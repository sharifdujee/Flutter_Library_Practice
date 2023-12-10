import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rington Player'),
      ),
      body: Center(
        child: Column(
          children: <Widget> [
            Padding(
                padding: const EdgeInsets.all(8.00),
                child: ElevatedButton(
                    onPressed: (){
                      FlutterRingtonePlayer.playAlarm();
                    },
                    child: const Text("Play Alarm")),
            ),
            Padding(padding: const EdgeInsets.all(10),
              child: ElevatedButton(onPressed: (){
                FlutterRingtonePlayer.playNotification();
              },
                  child: const Text('Play Notification')),
            )
          ],
        ),
      ),

    );
  }
}
