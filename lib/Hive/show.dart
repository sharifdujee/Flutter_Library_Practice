
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'hivedata.dart';
class ShowHiveData extends StatefulWidget {
  const ShowHiveData({super.key});

  @override
  State<ShowHiveData> createState() => _ShowHiveDataState();
}

class _ShowHiveDataState extends State<ShowHiveData> {
  var  person =  Person(
    name: 'Dave',

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ListTile(

              ),
              ElevatedButton(onPressed: (){
              },
                  child: Text('Show '))
            ],
          ),
        ),
      ),

    );
  }
}
